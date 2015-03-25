
%option nounput

%{
#define MAX_CAR 100
  char nom_identificador[ MAX_CAR ];
%}

alpha      [A-Za-z]
digit      [0-9]
espai      \ |\t|\b
novalinia  \r|\n|\r\n
ident      {alpha}({alpha}|{digit}|_)*

%% 
  
{digit}+ {return atoi(yytext);}

{ident}  {strcpy( nom_identificador, yytext ); return -1;}

{espai}

{novalinia} 
		  
.   {printf("Caracter incorrecte: <%s>\n", yytext );}

%%

extern FILE *yyin;

int main( int argc, char *argv[] )
{
  int number;

  yyin = fopen( argv[1], "r" );
  while( (number = yylex()) ) {
    if ( number > 0 )
      printf("Tenim el nombre: %d\n", number );
    else 
      printf("Tenim identificador: %s\n", nom_identificador );
  }
  return 0;
}

