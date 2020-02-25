/*program to count the number of operators and operands in a given expression*/
%{
int bo=0,bc=0,oprnd=0,oprtr=0;
%}
digit [0-9]
digits [0-9]+
letter [a-zA-Z]
letters [a-zA-Z]+
number {digits}*[.|/]?{digits}
%%
"("|"["|"{" {bo++;}
({letters}|{number})  {oprnd++;}
"++"|"--"|"+"|"-"|"*"|"/"|"%" {oprtr++;}
")"|"]"|"}"  {bc++;}
%%
int yywrap(void){}
int main(){
	printf("Enter the expression:");
	yylex();
	if(bo==bc && oprnd>oprtr)
		printf("Valid Expression\n");
	else
		printf("Invalid Expression\n");
		
	printf("Operator's Count:%d\n Opearnd's count:%d\n",oprtr,oprnd);
}
