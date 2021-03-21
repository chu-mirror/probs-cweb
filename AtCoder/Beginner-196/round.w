@* Round Down.
Given an integer or a decimal $X$, 
round it down to an integer and print the result.

$0\leq X\leq 10^100$, 
$X$ is an integer or a decimal with at most $100$ digits
after the decimal point, withoud unnecessary leading zeros.

@c
@<includes@>@/
@<data@>@/
@<prototypes@>

@ Read and print.
@c
int
main(int argc, char *argv[])
{
	char c;
	while((c = getchar()) != EOF) {
		if (c == '.') {
			break;
		}
		putchar(c);
	}
}

@ @<test data@>=
"5.90", "5",

@i des.wc
