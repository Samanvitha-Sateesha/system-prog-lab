/*count the number of positive and negative integers and fractions*/
%{
 int posint=0,posfrac=0,negint=0,negfrac=0;
%}
digit [0-9]
digits {digit}+
posinteger [+]?{digits}
posfraction [+]?{digits}*[.|/]{digits}
neginteger -{digits}
negfraction -{digits}*[.|/]{digits}

%%
{posinteger} {posint++;}
{neginteger} {negint++;}
{negfraction} {negfrac++;}
{posfraction} {posfrac++;}
%%

int yywrap(void)
{}
int main(){
	printf("Enter the string:");
	yylex();
	printf("Positive Integer:%d\nPositive Fraction:%d\nNegative Integer:%d\nNegative Fraction:%d\n",posint,posfrac,negint,negfrac);
	return 0;
}
