
%option nounput


majuscula  [A-Z]
minuscula  [a-z]
digit      [0-9]
arrova     @
punt       .
mes        \+
novalinia  \r|\n|\r\n
espai      \ |\t|\b

%% 
  

Nom:{espai}{majuscula}{minuscula}+{espai}{majuscula}{minuscula}+{espai}{majuscula}{minuscula}+{novalinia} printf("OK nom correcte: %s", yytext );

email:{espai}({minuscula}|{digit})+{arrova}({minuscula}|{digit})+{punt}{minuscula}+{novalinia} printf("OK email correcte: %s", yytext );

Telf:{espai}({digit}{9}{novalinia}|{mes}{digit}{11}{novalinia}) printf("OK telefon correcte: %s", yytext );

.+{novalinia} printf(" ! dades incorrectes: %s", yytext );

%%

extern FILE *yyin;

int yywrap() { return 0; }

int main( int argc, char *argv[] )
{

  yyin = fopen( argv[1], "r" );
  yylex();
  return 0;
}
