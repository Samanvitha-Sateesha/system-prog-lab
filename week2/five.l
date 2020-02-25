/*to count the number of scanf and printf */
%{
int sf=0,pf=0;
%}
%%
"scanf" {sf++; fprintf(yyout,"read");}
"printf" {pf++; fprintf(yyout,"write");}
%%
int yywrap(void)
{}
int main(){
	yyin=fopen("input5.c","r");
	yyout = fopen("output5.c","w");
	printf("Reading input...\n");
	yylex();
	printf("Scanf's:%d\nPrintf's:%d\n",sf,pf);
	return 0;
}	
