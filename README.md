# Simple memory usage plotting with gnuplot

If all you need is to plot memory usage over time on ASCII text the following
recipe with gnuplot should do it for you. Ideally we'd want this to just plot
onto a file every second but that would incur the requirement of having gnuplot
on the target. We can also extract this data with snmp from the host if we had
snmp installed on the target. That's one option of of how real graph plotters
do it.

# Requirements

On the target node, nothing, just /usr/bin/free.

On the host where we graph just install gnuplot.

# Record memory usage

Git clone this tree and run, or just copy over mem.sh and run that there.

```bash
make plot
```

# Plot usage

scp over the memory.txt file to the host and run:

```bash
make plot
```

# Example

The file `example-graph.txt` is an example output. The file
`example-memory.txt.xz` is an example input memory.txt file.
The uncompressed `memory.txt` is 21 MiB and it shows enough
recording for over 800 hours, that's a bit over a month's worth
of data.

To simulate the graph data and generate it yourself you can use:

```
make example
```

# Notes

The free command is schedule to sleep 1 second but it has no secondary command
to run, so although we sleep 1 second it would seem we run this for every 2
seconds. Running time on it however shows we run the recording every 1 second.
Check for yourself:

```bash
time $(echo free -k -s 1 -c 1 | grep Mem | awk '{print $3}' && sleep 1)
```
