%{
    #include<stdio.h>
    #include<string.h>
    #include<stdlib.h>
    int flag=0;
%}
%%
[a-zA-Z]* {
    for(int i=0;i<yyleng;i++){
        if(yytext[i]=='a' && yytext[i+1]=='a'){
            flag=1;
            break;
        }
    }
}
[\n] {
    if(flag==1){
        printf("Conatins aa");
        flag=0;
    }
    else{
        printf("does not contain aa");
    }
}
%%
int main(){
    printf("Enter the string");
    yylex();
    return 0;
}
int yywrap(){
    return 1;
}
