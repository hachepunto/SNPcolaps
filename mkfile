

# ordenar por Cromosoma, posición y secuencia
results/%.sorted.csv:	data/%.csv
	mkdir -p `dirname $target`
	head -n1 $prereq \
	> $target.build
	tail -n+2 $prereq \
	| gsort -k4,5 -k3,3 -k1,1r -V -t, \
	>> $target.build \
	&& mv $target.build $target

# Colapsar las entradas SNPs en donde la secuencia, cromosoma y la coordenada son iguales

results/%.colapsed.csv:	results/%.sorted.csv
	mkdir -p `dirname $target`
	bin/colapsador $prereq \
	> $target.build \
	&& mv $target.build $target



