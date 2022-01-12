   /* cs152-miniL phase1 */
   
%{   
   /* write your C code here for definitions of variables and including headers */
	
%}

   /* some common rules */
DIGIT	[0-9]
ALPHA	[a-zA-Z]
NUMBER	{DIGIT}{DIGIT}*
colon	[:]
equal	[=]
ASSIGN	{colon}{equal}
SUB	[-]
ADD	[+]
MULT	[*]
DIV	[/]
MOD	[MOD]
EQ	{equal}{equal}
LT	[<]
GT	[>]
NEQ	{LT}{GT}
LTE	{LT}{equal}
GTE	{GT}{equal}
IDENT	{ALPHA}({DIGIT}|{ALPHA}|"_")*({DIGIT}|{ALPHA})*
pound	[#]
space	[" "]
tab	[\t]
ENT	[\n]
comment {pound}{pound}({tab}|{space})*.*{ENT}
whitespace	{ENT}|{tab}|{space}

%%
   /* specific lexer rules in regex */
"function"	{printf("FUNCTION\n");}
"beginparams" 	{printf("BEGIN_PARAMS\n"); }
"endparams"   	{printf("END_PARAMS\n"); }
"beginlocals" 	{printf("BEGIN_LOCALS\n"); }
"endlocals"   	{printf("END_LOCALS\n"); }
"beginbody"   	{printf("BEGIN_BODY\n"); }
"endbody"     	{printf("END_BODY\n"); }
"integer"     	{printf("INTEGER\n"); }
"array"       	{printf("ARRAY\n"); }
"of"          	{printf("OF\n"); }
"if"          	{printf("IF\n"); }
"then"        	{printf("THEN\n"); }
"endif"       	{printf("ENDIF\n"); }
"else"        	{printf("ELSE\n"); }
"while"       	{printf("WHILE\n"); }
"do"          	{printf("DO\n"); }
"for"         	{printf("FOR\n"); }
"beginloop"   	{printf("BEGINLOOP\n"); }
"endloop"     	{printf("ENDLOOP\n"); }
"continue"    	{printf("CONTINUE\n"); }
"read"        	{printf("READ\n"); }
"write"       	{printf("WRITE\n"); }
"and"         	{printf("AND\n"); }
"or"          	{printf("OR\n"); }
"not"         	{printf("NOT\n"); }
"true"        	{printf("TRUE\n"); }
"false"       	{printf("FALSE\n"); }
"return"      	{printf("RETURN\n"); }
";"		{printf("SEMICOLON\n");}
{colon}		{printf("COLON\n");}
","		{printf("COMMA\n");}
"("		{printf("L_PAREN\n");}
")"		{printf("R_PAREN\n");}
"["		{printf("L_SQUARE_BRACKET\n");}
"]"		{printf("R_AQUARE_BRACKET\n");}
{ASSIGN}	{printf("ASSIGN\n");}
{SUB}		{printf("SUB\n");}
{ADD}		{printf("ADD\n");}
{MULT}		{printf("MULT\n");}
{DIV}		{printf("DIV\n");}
{MOD}		{printf("MOD\n");}
{EQ}		{printf("EQ\n");}
{NEQ}		{printf("NEQ\n");}
{LT}		{printf("LT\n");}
{GT}		{printf("GT\n");}
{LTE}		{printf("LTE\n");}
{GTE}		{printf("GTE\n");}
{comment}	{printf("");}
{IDENT}		{printf("IDENT %s\n", yytext);}
{NUMBER}	{printf("NUMBER %s\n", yytext);}
{whitespace}	{printf("");}
		/*.		{printf("ERROR %s\n", yytext);}*/
%%
	/* C functions used in lexer */

int main(int argc, char ** argv)
{
   yylex();
}
