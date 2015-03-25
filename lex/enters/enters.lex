
%option nounput

digit      [0-9]
novalinia  \r|\n|\r\n

%% 
  
{digit}+ return atoi(yytext);


{novalinia} 

. printf("Caracter incorrecte: <%s>\n", yytext );

%%

extern FILE *yyin;

int main( int argc, char *argv[] )
{
  int number;

  yyin = fopen( argv[1], "r" );
  while( (number = yylex()) ) {
    printf("Tenim el nombre: %d\n", number );
  }
  return 0;
}

