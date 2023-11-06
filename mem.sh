#!/bin/bash

while true; do free -k -s 1 -c 1 | grep Mem | awk '{print $3}' >> memory.txt ; sleep 1; done
