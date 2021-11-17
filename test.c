#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <stdbool.h>
#include "test.h"

struct Place crearPlace(int id, int token){
    struct Place p;
    p.id = id;
    p.token = token;
    return p;
};

struct Transicion crearTransicion(int id){
    struct Transicion t;
    t.id = id;
    t.estado = false;
    return t;
}

struct ArcoPT crearArcoPT(int place, int transicion){
    struct ArcoPT pt;
    pt.id_p = place;
    pt.id_t = transicion;
}

struct ArcoTP crearArcoTP(int transicion, int place){
    struct ArcoTP tp;
    tp.id_t = transicion;
}


void yyerror(char *s, ...)
{
    va_list ap; va_start(ap,s);
    fprintf(stderr, "%d: error: ", yylineno);
    vfprintf(stderr, s, ap);
    fprintf(stderr, "\n");
}

int main(){
    
    printf("> ");
    return yyparse();
}