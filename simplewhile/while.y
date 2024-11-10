%{
    #include<stdio.h>
    int yylex();
    int yyerror();
    int valid =0;
%}

%token WHILE PARA OPERAND OPERATOR NEWLINE SEMICOLON CURLY
 
%%
start: WHILE PARA A PARA CURLY start CURLY NEWLINE |  ;
A: OPERAND OPERATOR OPERAND
    |
    ;
%%
int yyerror(){
    printf("Not Valid");
    valid=1;
    return 1;
}
int main(){
    printf("Enter the expression");
    yyparse();
    if(valid==0){
        printf("Valid");
        
    }
}
