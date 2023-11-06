all:

plot:
	@./mem.sh

graph:
	@if [ ! -f memory.txt ]; then echo "memory.txt missing" && exit 1; fi
	@./run-gnuplot.sh

example:
	@xz -d -c example-memory.txt.xz > memory.txt
	@make graph

clean:
	rm -f memory.txt example-memory.txt graph.txt
