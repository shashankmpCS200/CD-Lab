%option noyywrap
%{
#include<stdio.h>
%}
%%
[0-9]+  {printf("Entered input is a number: %s\n",yytext);}
[+-]  {printf("Entered input is a operator: %s\n",yytext);}
[ \t\n]  {/*ignore whitespaces and newline*/}
[a-zA-Z]*  {printf("invalid character:%s\n",yytext);}
%%

int main()
{
printf("Enter: ");
yylex();
return 0;
}
