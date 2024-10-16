#include<stdio.h>
#include<string.h>
#include<ctype.h>
void main(){
    int t=0;
    int l=0;
    int flag,i,j=0;
    char ch,str[20];
    FILE *input,*output;
    input=fopen("input.txt","r");
    output=fopen("output.txt","w");
    char keyword[20][20]={"int","main","if","else","do","while"};
    fprintf(output,"line no \t Tokenno \t token \t identifier \n");
    while(!feof(input)){
        i=0;
        flag=0;
        ch=fgetc(input);
        if(ch=='+' || ch=='-'){
            fprintf(output,"%d %d %c operator\n",l,t,ch);
            t++;
        }
        else if (ch==';' || ch=='{' || ch=='}' ||ch=='('){
            fprintf(output,"%7d\t\t %7d\t\t Special symbol\t %7c\n",l,t,ch);
			t++;
        }
        else if (isdigit(ch)){
             fprintf(output,"%7d\t\t %7d\t\t Number Literal\t %7c\n",l,t,ch);
			t++;
        }
        else if (isalpha(ch)){
            str[i]=ch;
            i++;
            ch=fgetc(input);
            while (ch!=' ' && isalnum(ch))
            {
                str[i]=ch;
                i++;
                ch=fgetc(input);
            }
            str[i]='\0';
            for (j=0;j<=30;j++){
                if (strcmp(str,keyword[j])==0){
                    flag=1;
                    break;
                }
            }
            if (flag==1){
                fprintf(output,"%d %d Keyword %7s \n ",l,t,str);
                t++;
            }
            else{
                fprintf(output,"%d %d identifier %7s \n",l,t,str);
                t++;
            }
        }
        else if(ch=='\n'){
            l++;
        }
    }
    fclose(input);
	fclose(output);

}
