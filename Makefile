.PHONY: bin

all:
	para.sh

bin:
	gcc -Wall dan_eqn.c -o dan_eqn

data:
	dan_eqn

store:
	mkdir -p output
	mv *.dat *.info output/
	mv *.png output/

restore:
	mv output/* .

plot:
	bin/plot.sh

animate:
	bin/animate.sh

clean:
	@rm snapshot_*
	@rm dan_eqn

dir:
	bin/dir.sh

tail:
	@echo "trim foo.dat file:"
	@echo "  parameters go to foo.dat.info."
	@echo "  data goes to foo.dat."
	@echo "  then can use dataplot.m to plot the data."
	@tail.sh