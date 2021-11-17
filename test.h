extern int yylineno;
#include <stdbool.h>

void yyerror(char *s, ...);

struct Place{
  int id;
  int token;
};

struct Transicion{
  int id;
  bool estado;
};

struct ArcoPT{
    int id_p;
    int id_t;
};

struct ArcoTP
{
    int id_p;
    int id_t;
};

/* ---------------------------------------- */

struct Place crearPlace(int id, int token);
struct Transicion crearTransicion(int id);
struct ArcoPT crearArcoPT(int place, int transicion);
struct ArcoTP crearArcoTP(int transicion, int place);
