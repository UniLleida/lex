%x operador1
%x operand1
%x operand2

%option nounput

digit      [0-9]
punt       .
punticoma  ;
mes        \+
mul        \*
res        \-
div        \/

enter     {digit}+
flotant   {enter}{punt}{enter}
operador  ({mes}|{mul}|{res}|{div})
operand   ({enter}|{flotant}) 
novalinia  \r|\n|\r\n
espai      \ |\t|\b

%% 

<INITIAL>Calc{espai} BEGIN(operand1); printf("start operation");

<operand1>{operador1} BEGIN(operad);

<opera>{operan} BEGIN(operad);



%%
// <INITIAL>.+{novalinia} printf(" ! operacio no acceptada: %s", yytext );

extern FILE *yyin;

int yywrap() { return 0; }

int main( int argc, char *argv[] )
{

  yyin = fopen( argv[1], "r" );
  yylex();
  return 0;
}
