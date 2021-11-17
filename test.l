%option noyywrap nodefault yylineno

%{
#include "test.h"
#include "test.tab.h"
//({alpha})* {yylval.str = strdup(yytext);}
//alpha [a-zA-Z]
%}


%%


[0-9]+  { yylval.val = atoi(yytext); return id; }
"P" { return 'P'; }
"T" { return 'T'; }
"A" { return 'A'; }
"M" { return 'M'; }
"=" { return '='; }
"(" { return '('; }
"," { return ','; }
")" { return ')'; }
"+" { return '+'; }
\n      { return EOL; }
[ \t]   { /* ignore white space */ }
.   { yyerror("Caracter no reconocido %c\n", *yytext); }
%%


