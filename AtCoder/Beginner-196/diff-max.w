@* Difference Max.
Given are integers $a$, $b$, $c$, and $d$.
We will choose integers $x$ and $y$ such that $a\leq x\leq b$ and
$c\leq y\leq d$. Find the maximum possible value of $x-y$ here.

All values in input are integers, $-100\leq a\leq b\leq 100$,
$-100\leq c\leq d\leq 100$.

@c
@<includes@>@/
@<data@>@/
@<prototypes@>


@ Since $-d\leq -y\leq -c$, we have $a-d\leq x-y\leq b-c$.
So the answer is $b-c$.

@c
int
main(int argc, char *argv[])
{
	int a, b, c, d;
	scanf("%d%d%d%d", &a, &b, &c, &d);
	printf("%d", b-c);
}

@ The test data.
@<test data@>=
"0 10\n0 10", "11",@/
"-100 -100\n100 100", "-200",@/
"-100 100\n-100 100", "200",

@i des.wc
