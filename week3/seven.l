%{
#include<stdio.h>
#include<string.h>
int compound=0;
%}
letter [a-zA-Z]
word {letter}+
%%
{word} {if(strcmp(yytext,"and")==0 ||
			strcmp(yytext,"or")==0 ||
			strcmp(yytext,"but")==0 ||
			strcmp(yytext,"while")==0) {compound =1;}}

%%
int yywrap(void){}
int main(){
	printf("Enter the statement:");
	yylex();
	if(compound)
		printf("Compound Statement");
	else
		printf("Simple Statement");
	return 0;
}
