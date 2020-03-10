%{
	#include<stdlib.h>
	#include"y.tab.h"
	void yyerror(char *);
%}

%%
[a-zA-Z] {yylval= *yytext-'a';
		return VARIABLE;}
[0-9]+ {yylval = atoi(yytext);
		return INTEGER;
		}
[-+()=/*] {return *yytext;}
. {yyerror("invalid character");}
%%
int yywrap(void){
	return 1;}