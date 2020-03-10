%token VARIABLE INTEGER OP1 OP2 OP3 OP4 PR1 PR2
%left '+' '-'
%left '*' '/'
%start A
%{
	void yyerror(char *);
	int yylex(void);
	int sym[26];
	#include<stdio.h>
%}
%%

A: E	{printf(" end");}
 ;

E: E OP1 T	{printf("+");}
  |E OP2 T	 {printf("-");} 
  |T
  ;
T:T OP3 F	{printf("*");} 
  |T OP4 F	{printf("/");}
  |F
   ;
F:ID
  ;
ID:VARIABLE	{printf("%c",$1);}
  |INTEGER	{printf("%d",$1);}
  ;
%%
void yyerror(char * s){
	fprintf(stderr,"%s",s);
	}
int main(void){
	yyparse();
	return 0;
	}