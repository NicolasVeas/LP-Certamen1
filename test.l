%option noyywrap nodefault yylineno

%{
#include "test.h"
#include "test.tab.h"
//({alpha})* {yylval.str = strdup(yytext);}
//alpha [a-zA-Z]
%}


%%

/*  expresion regular para los numeros */
[0-9]+  { yylval.val = atoi(yytext); return id; }

/*  expresion regular para los places */
"P" { return 'P'; }

/*  expresion regular para las transiciones*/
"T" { return 'T'; }

/*  expresion regular para los arcos */
"A" { return 'A'; }

/*  expresion regular para mostrar la red */
"M" { return 'M'; }

/*  expresion regular para los simbolos = ( , ) + */
"=" { return '='; }
"(" { return '('; }
"," { return ','; }
")" { return ')'; }
"+" { return '+'; }
\n      { return EOL; }
[ \t]   { /* ignore white space */ }
.   { yyerror("Caracter no reconocido %c\n", *yytext); }
%%


