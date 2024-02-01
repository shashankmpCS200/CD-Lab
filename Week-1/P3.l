%{
#include<stdio.h>
int vow_count=0;
int const_count=0;
%}
%%
[aeiouAEIOU] {vow_count++;}
[a-zA-Z] {const_count++;}
\n {printf("vow_count=%d,const_count=%d",vow_count,const_count);}
%%
int yywrap()
{
}
int main()
{
printf("Enter the string: ");
yylex();
return 0;
}
