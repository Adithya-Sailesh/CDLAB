%{
    #include<stdio.h>
    int sc=0,lc=0,cc=0,wc=0;
%}
%%
[aeiouAEIOU] { lc++; cc+=yyleng;printf("Vowel encountered: %s\n", yytext);}
[^aeiouAEIOU] { sc++; cc+=yyleng;printf("Constant encountered: %s\n", yytext);}
%%
int main(){
    printf("Enter the string\n");
    yylex();
    printf("Character %d",cc);
    printf("Vowel%d",lc);
    printf("constant %d",--sc);
    return 0;
}
int yywrap(){
    return 1;
}

to run
lex filename.l
cc lex.yy.c
./a.out

