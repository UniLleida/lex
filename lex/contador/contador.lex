
%option nounput
%option noinput

%{
  int num_chars = 0;
%}

%%

\n      ++num_chars;
.	++num_chars;

%%

int main()
{
  yylex();
  printf(" # de caracters = %d\n", num_chars);
  return 0;
}

