%{
    #include<stdio.h>
    int sc=0,lc=0,cc=0,wc=0;
%}
%%
[\n] { lc++; cc+=yyleng;}
[ \t] { sc++; cc+=yyleng;}
[^\t\n ]+ { wc++; cc+=yyleng;}
%%
int main(){
    printf("Enter the string\n");
    yylex();
    printf("Character %d",cc);
    printf("word %d",wc);
    printf("line %d",lc);
    printf("space %d",sc);
    return 0;
}
int yywrap(){
    return 1;
}
