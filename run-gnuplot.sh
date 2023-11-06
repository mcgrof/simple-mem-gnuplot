#!/bin/bash
gnuplot -e "filein='memory.txt';  fileout='graph.txt'" plot-mem.txt
