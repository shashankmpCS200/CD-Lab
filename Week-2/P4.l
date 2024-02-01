%{
   
   #include<stdio.h>
%}
alpha[a-zA-Z]
digit[0-9]
%%
(float|int) {printf("keyword\n");}
{alpha}({digit}|{alpha})* {printf("identifier\n");}
{digit}({digit}|{alpha})* {printf("invalid token\n");}
%%
int yywrap()
{
}
int main()
{
yylex();
return 0;
}
