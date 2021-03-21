@* Doubled.
Given is an integer $N$.
How many integers $x$ between $1$ and $N$ (inclusive) satisfy the following condition?

The decimal representation(without leading zeros of) of $x$ 
has an even number of digits, and its first and second halves are equal as strings.

@c
@<includes@>@/
@<data@>@/
@<prototypes@>

@ Consider three cases, the length of $N$ in decimal representation is $n$,
the final answer is $a$:
$N$ has odd number of digits, 
$N$ has even number of digits, and the first halve($f$) bigger than the second($s$),
$N$ has even number of digits, and the first halve less or equal to the second.

At case 1, because $x$ has an even number of digits, $1\leq x\leq9\ldots9< N$,
the number of $9$s is $n-1$.  At case 2 or 3, $a\leq fi$ is clear, at case 3,
$a$ can equal to $f$, but can not at case 2. Then, consider the $f-1$, 
luckily, it suffice.
@c
int
main(int argc, char *argv[])
{
	char num[15];
	scanf("%s", num);

	int len = strlen(num);
	if (len % 2) {
		@<print the longest 9s@>@;
	} else {
		int fi, se;
		se = atoi(&num[len/2]);
		fi = atoi((num[len/2]='\0', num));
		if (fi > se) {
			printf("%d", fi-1);
		} else {
			printf("%d", fi);
		}
	}
}

@ @<print the lon...@>=
{
	int i = len/2;
	if (i == 0) {
		printf("0");
	} else {
		do {
			putchar('9');
		} while (--i);
	}
}

@ Test.
@<test data@>=
"999", "9",@/
"9", "0",@/
"33", "3",@/
"1333","13",@/
"10000000", "999",

@i des.wc
