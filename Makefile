.PHONY: bin

bin:
	gcc -Wall dan_eqn.c -o dan_eqn

data:
	dan_eqn

plot:
	bin/plot.sh

animate:
	bin/animate.sh

clean:
	@rm snapshot_*
	@rm dan_eqn

dir:
	bin/dir.sh
