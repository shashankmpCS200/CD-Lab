%option noyywrap
%{
#include<stdio.h>
%}
%%
int|char|float {printf("\n%s->keyword",yytext);}
,|; {printf("\n %s->separator",yytext);}
[a-zA-Z0-9]* {printf("\n %s->identifier",yytext);}
%%
int wrap()
{
}
int main()
{
printf("Enter: ");
yylex();
return 0;
}
