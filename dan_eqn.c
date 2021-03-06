#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define PI 3.14159265359

void init(double *data, int n)
{
    int i;
    for (i=0; i<n; i++)
        data[i] = 2.0;
}

void write(char *fn, char *mode, double *data, int n, double dx, double time)
{
    int i;
    FILE * fp = fopen(fn, mode);

    fprintf(fp, "ZONE STRANDID=1, SOLUTIONTIME=%lf\n", time);

    for (i=0; i<n; i++)
        fprintf(fp, "%lf %lf\n", dx*i, data[i]);

    fclose(fp);
}

void apply_no_flux(double *h, int n)
{
    h[2] = h[3];
    h[1] = h[4];
    h[0] = h[5];

    h[n-3] = h[n-4];
    h[n-2] = h[n-5];
    h[n-1] = h[n-6];
}

#include "parameters/para_pp.h"

void integrate_time_step(double *h, int n, double dx, double dt)
{
    int i;
    double p2 = 57.0;
    double p4 = 2.0 * PI / 13.0;
    double sigma_eta = 0.0019;

    double P[n];
    double Px[n];
    double hxxx[n];
    double term[n];

    for (i=0; i<n; i++)
    {
        double x = i*dx;
        // x-dx*n/2 to move the center of the gaussian to dx*n/2.
        double x_p2_sq = pow((x-dx*n/2)/p2, 2);

        P[i] = exp(-2.0 * x_p2_sq) * ( p3 + cos(p4*(x-dx*n/2)+p5) );
    }

    apply_no_flux(P, n);

    for (i=1; i<n-1; i++)
        Px[i] = (P[i+1] - P[i-1]) / (2.0*dx);

    apply_no_flux(hxxx, n);

    for (i=2; i<n-2; i++)
        hxxx[i] = ( -0.5*h[i-2] + h[i-1] - h[i+1] + 0.5*h[i+2] ) / pow(dx,3);

    for (i=2; i<n-2; i++)
        term[i] = 1.0/3.0 * pow(h[i],3) * sigma_eta * (p1_sigma * Px[i] - hxxx[i]);

    apply_no_flux(term, n);

    for (i=3; i<n-3; i++)
        h[i] = h[i] + dt * (term[i+1] - term[i-1])/(2.0*dx);

}

int main()
{
    int n = 1000;
    double L = 240.0;
    double T = 5381.0;
    double dt = 0.01;

    double dx = L/((double)n);

    int istep;
    int nsteps = (int) (T/dt);

    double *h;
    h = (double *) malloc(sizeof(double) * n);

    init(h, n);

    write("output.dat", "w", h, n, dx, 0);

    char basename[80] = "dat", filename[100];
    FILE *snapshot;
    int frame = 0, mm = 0;

    for (istep=0; istep<nsteps; istep++)
    {
        if (istep % 10000 == 0) printf("%f\n", istep/((float)nsteps));
        if ((istep+1) % 10000 == 0)
            {
                /* write("output.dat", "a", h, n, dx, (istep+1)*dt); */
                if (frame < 10)
                    sprintf(filename, "snapshot_%d%d.%s", 0, frame++, basename);
                else
                    sprintf(filename, "snapshot_%d.%s", frame++, basename);

                snapshot = fopen(filename, "w");

                for(mm = 0; mm < n; mm++)
                    fprintf(snapshot, "%f\n", h[mm]);
                fclose(snapshot);
            }

        integrate_time_step(h, n, dx, dt);
        apply_no_flux(h, n);
    }


    free(h);

    return 0;
}
