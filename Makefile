.PHONY: bin

all: ss pp sp 45 lr

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
ss:
	cp exec.sh.bak exec.sh
	exec.sh
pp:
	sed 's/ss/pp/' exec.sh.bak > exec.sh
	exec.sh
sp:
	sed 's/ss/sp/' exec.sh.bak > exec.sh
	exec.sh

45:
	sed 's/ss/45/' exec.sh.bak > exec.sh
	exec.sh

lr:
	sed 's/ss/lr/' exec.sh.bak > exec.sh
	exec.sh


