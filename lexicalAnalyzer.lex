%{
	#include <stdio.h>
	#include "contacts.tab.h"
%}

%%

[A-Z][a-z]+		{/* Name 1 uppercase 1-n lower */
			 yylval.sValue = strdup( yytext );
			 return NAME;
			}
[0-9]{3}-[0-9]{4}	{/* Phone format: xxx-xxxx */
			 yylval.sValue = strdup( yytext );
			 return PHONE;
			}
[A-z]+@[a-z]+\.[a-z]+	{/* Email format: 1-n upper or lower case, @,
			    1-n lowercase, . , 1-n lowercase. */
			 yylval.sValue = strdup( yytext );
			 return EMAIL;
			}
[A-Z]+			{/* Streen Name format: 1-n uppercase only. */
			 yylval.sValue = strdup( yytext ); 
			 return STREET_NAME;
			}
[0-9]{5}		{ /* Zipcode format: 5 numbers. */
			 yylval.sValue = strdup( yytext );
			 return ZIPCODE;
			}
[a-z]{2}		{ /* Street type format: 2 lowercase chars */
			 yylval.sValue = strdup( yytext );
			 return STREET_TYPE;
			}
[0-9]{4}		{ /* Street number format: 4 numbers. */
			 yylval.sValue = strdup( yytext );
			 return STREET_NUM;
			}
\s			/* clear spacing */;

%%

