d[0-9]
%{
/* d is for recognising digits */
int c1=0,c2=0,c3=0,c4=0,c5=0,c6=0,c7=0;
/* c1 to c7 are counters for rules a1 to a7 */
%}
%%
({d})*00 { c1++; printf("%s -> string ending in 00\n",yytext);}
({d})*222({d})* { c2++; printf("%s -> string with three consecutive 222’s \n",yytext);}
(1(0)*(11|01)(01*01|00*10(0)*(11|1))*0)(1|10(0)*(11|01)(01*01|00*10(0)*(11|1))*10)* {
c4++;
printf("%s -> string beginning with a 1 which, interpreted as the binary representation of an integer, is congruent to zero modulo 5 \n",yytext);
}
({d})*1{d}{9} {
c5++; printf("%s -> string such that the 10th symbol from the right end is 1 \n",yytext);
}
({d})* {
int i,c=0;
if(yyleng<5)
{
printf("%s doesn't match any rule\n",yytext);
}
else
{
for(i=0;i<5;i++) { if(yytext[i]=='5') {
c++; } }
if(c>=2)
{
for(;i<yyleng;i++)
{
if(yytext[i-5]=='5') {
c--; }
if(yytext[i]=='5') { c++;
}
if(c<2) { printf("%s doesn't match any rule\n",yytext);
break; }
}
if(yyleng==i)
{
printf("%s -> string such that every block of five consecutive symbols contains at least two 5’s\n",yytext); c3++; }
}
else
{
printf("%s doesn't match any rule\n",yytext);
}
}
}
%%
int yywrap()
{
}
int main()
{
printf("Enter text\n");
yylex();
printf("Total number of tokens matching rules are : \n");
printf("Rule A : %d \n",c1);
printf("Rule B : %d \n",c2);
printf("Rule C : %d \n",c3);
printf("Rule D : %d \n",c4);
printf("Rule E : %d \n",c5);
return 0;
}
