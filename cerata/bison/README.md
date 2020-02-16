# bison

## build
bison 3.4.x has parallelism issues and throws the following error:
`cp: cannot stat `examples/c/reccalc/scan.stamp.tmp': No such file or directory`
which should be fixed in bison 3.5.x according to:

<https://www.mail-archive.com/bug-bison@gnu.org/msg03411.html>
