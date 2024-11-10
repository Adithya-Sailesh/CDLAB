%{
    #include"y.tab.h"
%}

%%
while {return WHILE ;}
[()] {return PARA ;}
[a-zA-Z0-9]* {return OPERAND ;}
"="|"<"|">"|"==" {return OPERATOR ;}
[{}] {return CURLY ;}
[;] {return SEMICOLON ;}
[\n] {return NEWLINE ;}
%%
int yywrap(){
    return 1;
}

//Onlyworksfor simple while(nested not working)
example
while(){}
while(i<10){}
yacc -d while.y
lex while.l
cc lex.yy.c y.tab.c
./a.out
