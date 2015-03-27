%x opera1
%x opera2
%x operad
%x finish

%option nounput noinput
%{

int opint1=0;
int opint2=0;
float opfloat1=0;
float opfloat2=0;
char operador='~';
int float_count=0;
int data_count=0;

%}

digit      [0-9]
punt       .
punticoma  ;
mes        \+
mul        \*
res        \-
div        \/

enter     ({digit}+|({res}{digit}+))
flotant   {enter}{punt}{digit}+
operador  ({mes}|{mul}|{res}|{div})
novalinia  \r|\n|\r\n
espai      \ |\t|\b

%% 

<INITIAL>Calc{espai}+ BEGIN(opera1); {}; 

<operad>{operador}{espai}+ BEGIN(opera2); {operador=yytext[0];data_count+=1;};

<opera1>{enter}{espai}+ BEGIN(operad); {opint1=atoi(yytext);data_count+=1;};
<opera1>{flotant}{espai}+ BEGIN(operad); {opfloat1=atof(yytext);float_count+=1;data_count+=1;};
<opera1>{flotant}^{espai} BEGIN(INITIAL); {return 1;};
<opera1>(^{enter}){espai} BEGIN(INITIAL); {return 1;};
<opera1>(^{flotant}){espai} BEGIN(INITIAL); {return 1;};

<opera2>{enter}{espai}*{novalinia}+ BEGIN(INITIAL); {opint2=atoi(yytext);data_count+=1;return 1;};
<opera2>{flotant}{espai}*{novalinia}+ BEGIN(INITIAL); {opfloat2=atof(yytext);float_count+=1;data_count+=1;return 1;};
<opera2>{flotant}(^({espai}|{novalinia})) BEGIN(INITIAL); {return 1;};
<opera2>(^{enter}) BEGIN(INITIAL); {return 1;};
<opera2>(^{flotant}) BEGIN(INITIAL); {return 1;};


%%


/*
<<EOF>> {yyterminate();return 0;}
<<EOF>> {printf("\n\nEOF\n\n");return 0;}
<INITIAL>.+{novalinia} printf(" ! operacio no acceptada: %s", yytext );
*/

extern FILE *yyin;

int yywrap() { return 0; }

int main( int argc, char *argv[] )
{
  yyin = fopen( "ex2.demo", "r" );
  while(yylex()){
    if (data_count<3){
       printf("OPERACIO INCORRECTA (%d/3)(%d,%d,%f,%f,%c)\n",data_count,opint1,opint2,opfloat1,opfloat2,operador);
    }else{
       if (float_count==0){
         printf("OPERACIO ENTERA DE %c\n",operador);
	 switch (operador){
           case '+':
             printf("la suma de %d i %d es %d\n",opint1,opint2,opint1+opint2);
             break;
           case '-':
             printf("la resta de %d i %d es %d\n",opint1,opint2,opint1-opint2);
             break;
           case '*':
             printf("la multiplicacio de %d i %d es %d\n",opint1,opint2,opint1*opint2);
             break;
           case '/':
             printf("la divisio de %d i %d es %d\n",opint1,opint2,opint1/opint2);
             break;
         }
       }else{
         if (opfloat1==0) opfloat1=(float) opint1;
         if (opfloat2==0) opfloat2=(float) opint2;
         printf("OPERACIO FLOTANT DE %c\n",operador);
	 switch (operador){
           case '+':
             printf("la suma de %f i %f es %f\n",opfloat1,opfloat2,opfloat1+opfloat2);
             break;
           case '-':
             printf("la resta de %f i %f es %f\n",opfloat1,opfloat2,opfloat1-opfloat2);
             break;
           case '*':
             printf("la multiplicacio de %f i %f es %f\n",opfloat1,opfloat2,opfloat1*opfloat2);
             break;
           case '/':
             printf("la divisio de %f i %f es %f\n",opfloat1,opfloat2,opfloat1/opfloat2);
             break;
         }
       }
       data_count=0;
       opfloat1=0;
       opfloat2=0;
       opint1=0;
       opint2=0;
    }
  };
  return 0;
}
