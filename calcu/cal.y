%{
    #include<stdio.h>
    #include<stdlib.h>
    int yyerror();
    int yylex();
%}

%token NUMBER

%%
start:exp   {printf("Result=%d",$1);}
    ;
exp: exp '+' term {$$=$1+$3;}
    | exp '-' term {$$=$1-$3;}
    | term  {$$=$1;}
    ;
term: term '*' factor {$$=$1*$3;}
    | term '/' factor {$$=$1/$3;}
    | factor {$$=$1;}
    ;
factor : '(' exp ')' {$$=$2;}
        | NUMBER {$$=$1;}
        ;
%%
int main(){
    printf("enter ");
    yyparse();
    return 0;
}
int yyerror(){
    return 0;
}
