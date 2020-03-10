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

A:E	{printf(" end");}
 ;
E:E OP1{printf("+");} T{printf(")");}
  |E OP2{printf("-");} T{printf(")");}
  |T
  |PR1 E PR2 K
  |
  ;
T:T OP3{printf("*");} F	
  |PR1 R1 PR2 K 
  |T OP4{printf("/");} F	
  |F
  |
   ;
R1:T
  ;
K:OP3{printf("*");} E
 |OP4{printf("/");} E
  |OP1{printf("+");} E
  |OP2{printf("-");} E
  |
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