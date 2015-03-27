%x comentari
%x include


%option nounput noinput
%{

char *includestr="";
int checkinclude=0;

%}

novalinia    \r|\n|\r\n
espai        \ |\t|\b
incomentari  \/\*
ficomentari  \*\/

%% 

<INITIAL>{incomentari} BEGIN(comentari);{return 1;};
<comentari>{ficomentari} BEGIN(INITIAL);{return 1;};
<comentari>. ;{return 1;};
<INITIAL>\/\/.+{novalinia} {return 1;};
<INITIAL>(#include) BEGIN(include);
<include>{espai}+ 
<include>[^ ^\t^\n]+   BEGIN(INITIAL);{
  printf("OPEN %s\n",yytext);
  //yyin = fopen( yytext, "r" );
  yyin = fopen( "include1.demo", "r" );
  if ( yyin )  yypush_buffer_state(yy_create_buffer( yyin, YY_BUF_SIZE ));
  return 1;
}     
<INITIAL>{novalinia}+ {printf("\n"); if (yytext[0]=='\0') yypop_buffer_state();return 1;};
<INITIAL>_ {printf("FILE END\n"); if (yytext[0]=='_') yypop_buffer_state();return 1;};
<INITIAL><<EOF>> {
  //yypop_buffer_state();
  //printf("//FILE END\n");
  //if ( !YY_CURRENT_BUFFER )  yyterminate();
  //return 0;
}
%%

/*
<INITIAL>(#include)(.+){novalinia} {checkinclude=1;includestr=yytext;return 1;};
*/


extern FILE *yyin;

int yywrap() { return 0; }



int main( int argc, char *argv[] )
{
  yyin = fopen( "ex3.demo", "r" );
  while(yylex()){
      //printf("line read\n");
    if (checkinclude){
      //yyin = fopen( "include1.demo", "r" );
      //if ( yyin )  yypush_buffer_state(yy_create_buffer( yyin, YY_BUF_SIZE ));
      //checkinclude=0;
    }
  };
  return 0;
}
