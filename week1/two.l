/*count number of characters,blanks,words and lines*/
%{
 int charc=0,blankc=0,wordc=0,linec=0;
%}
blank [ ]
charac [a-z]
line [\n]
%%
({charac}+) {wordc++; charc+=yyleng;}
{blank} {blankc++;}
{line} {linec++;}
%%

int yywrap(void)
{}
int main(){

	printf("Enter the string:");
	yylex();
	printf("The number of characters are %d, words are %d, blanks are %d and lines are %d",charc,wordc,blankc,linec);
	return 0;
}

