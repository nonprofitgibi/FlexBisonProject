%{
	#include <stdio.h>
%}

%%

[A-Z][a-z]+			{return NAME; }
[0-9]{3}-[0-9]{4}		{return PHONE; }
\w+@[a-z]+\.[a-z]+		{return EMAIL; }
[0-9]{4}			{return STREET_NUM; }
[A-Z]+				{return STREET_NAME; }
[a-z]{2}			{return STREET_TYPE; }
[0-9]{5}			{return ZIPCODE; }
\s				;

%%

