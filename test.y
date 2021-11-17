%{
#include <stdio.h>
#include <stdlib.h>
#include "test.h"

int contPlace = 0;
int contTransicion = 0;
int contArcoTP = 0;
int contArcoPT = 0;
int i;

struct Place A[10];
struct Transicion B[10];
struct ArcoPT C[10];
struct ArcoTP D[10];

struct Place p;
struct Transicion t;
struct ArcoPT pt;
struct ArcoTP tp;

//p = crear($1,$3); A[contPlace] = p; printf(" ID = %d \n> ", p.token); contPlace++;
%}

%union{ 
    char* str; 
    int val;
}

%token id
%token EOL 
%type<val> E id 

%%

start: {printf("INICIO\n"); }
 | start E EOL { printf("OK\n");};

E:  {printf("No ingreso nada"); }
 | 'P' '=' id ',' id { p = crearPlace($3,$5); A[contPlace] = p; contPlace++; }
 | 'T' '=' id { t = crearTransicion($3); B[contTransicion] = t; contTransicion++; }
 | 'A' '=' id ',' id { pt = crearArcoPT($3,$5); C[contArcoPT] = pt; contArcoPT++; }
 | 'M' id { printf("\n PLACES ID'S: "); for(i=0;i<10; i++){ printf("-> %d ", A[i].id);} printf("\n TRANSICION ID'S: "); for(i=0;i<10; i++){ printf("-> %d ", B[i].id);} printf("\n ARCO P->T: "); for(i=0;i<10; i++){ printf("-> P_id: %d y T_id: %d ", C[i].id_p, C[i].id_t);} }
 ;




%%

