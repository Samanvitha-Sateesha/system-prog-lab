/*recognise valid identifiers and count them*/
%{
#include<stdio.h>
#include<string.h>
int flag=0,count=0;
%}
dt "int"|"float"|"char"|"double"
letter [a-zA-Z]
word {letter}+
digit [0-9]
digits {digit}+
number (-)?{digits}*[.|/]?{digits}
blank " "
%%
{dt} {flag=1;}
{word} {if((flag==1) && strcmp(yytext,"main")!=0) {count++;}}
{word}"="({word}|{number}) {if((flag==1) && strcmp(yytext,"main")!=0) {count++;}}
";" {flag=0;}
[.|\n] ;
%%
int yywrap(void){}
int main(){
	yyin = fopen("input8.c","r");
	printf("Reading input file\n");
	yylex();
	printf("Count of identifiers:%d\n",count);
	return 0;
}	
