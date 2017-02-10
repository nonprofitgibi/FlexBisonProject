%code top {
#include <stdio.h>
}

%union {
	char *sValue;
}

%start file
%token NAME
%type<sValue> NAME
%token PHONE
%type<sValue> PHONE
%token EMAIL
%type<sValue> EMAIL
%token STREET_NUM
%type<sValue> STREET_NUM
%token STREET_TYPE
%type<sValue> STREET_TYPE
%token STREET_NAME
%type<sValue> STREET_NAME
%token ZIPCODE
%type<sValue> ZIPCODE
%type<sValue> contact

%%
file:	contact
|	contact file
;
contact: NAME NAME PHONE EMAIL STREET_NUM STREET_NAME STREET_TYPE ZIPCODE
	{printf("Name: %s\tName: %s\tPhone: %s\tEmail: %s\tStreet num: %s\tStreet name: %s\tStreet type: %s\tZipcode: %s\n",$1,$2,$3,$4,$5,$6,$7,$8);}

%%
int main(int argc, char* argv[]){
	yyparse();
}

int yyerror(char *msg){
	return fprintf(stderr, "YACC: %s\n", msg);
}
