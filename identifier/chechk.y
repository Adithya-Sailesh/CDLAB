%{
    #include<stdio.h>
    int yyerror();
    int yylex();
    int valid=1;
%}
%token letter digit
%%
start : letter s
s : letter s
    | digit s
    |
    ;
%%
int yyerror(){
    printf("Not Valid");
    valid=0;
    return 0;
}
int main(){
    printf("Enter the test");
    yyparse();
    if(valid==1){
        printf("Valid Identifier");
        return 1;
    }
}
