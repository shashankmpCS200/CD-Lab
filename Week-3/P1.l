%{
#include <stdio.h>
int cc=0;
%}
%x CMNT
%%
"/*" {BEGIN CMNT;}
<CMNT>. ;
<CMNT>"*/" {BEGIN 0; cc++;}
%%
int yywrap() { }
int main(int argc, char *argv[])
{
if(argc!=3)
{
printf("Usage : %s <scr_file> <dest_file>\n",argv[0]);
return 0;
}
yyin=fopen(argv[1],"r");
yyout=fopen(argv[2],"w");
yylex();
printf("\nNumber of multiline comments = %d\n",cc);
return 0;
}
