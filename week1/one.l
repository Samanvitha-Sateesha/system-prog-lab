%{
	int vcount=0,ccount=0;
%}

%%
[aeiou] {vcount++;}
[a-z] {ccount++;}
%%

int yywrap(void)
{}
int main(){

	printf("Enter the string:");
	yylex();
	printf("The number of vowels is %d and consonants is %d",vcount,ccount);
	return 0;
}
