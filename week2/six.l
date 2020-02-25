/*Recognize a valid arithematic expression and count the number of operators in it*/
%{
int bo=0,bc=0,oprnd=0,oprtr=0;
%}
digit [0-9]
digits [0-9]+
letter [a-zA-Z]
letters [a-zA-Z]+
%%
"("|"["|"{" {bo++;}
({letters}|{digits})  {oprnd++;}
"++"|"--"|"+"|"-"|"*"|"/"|"%" {oprtr++;}
")"|"]"|"}"  {bc++;}
%%
int yywrap(void){}
int main(){
	printf("Enter the expression:");
	yylex();
	if(bo==bc && oprnd>oprtr)
		printf("Valid Expression");
	else
		printf("Invalid Expression");
		
	printf("Operator's Count:%d\n",oprtr);
}
