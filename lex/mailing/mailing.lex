
%array

%{
     char nom[ YYLMAX  ];
%}

lletra [a-zA-Z]

%%

nom\ {lletra}+   strcpy( nom, &yytext[4] );
[Hh]ola          printf("%s %s!", yytext, nom );

