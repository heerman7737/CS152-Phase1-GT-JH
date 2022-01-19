   /* cs152-miniL phase1 */
   
%{   
   /* write your C code here for definitions of variables and including headers */
	int line = 1;
	int col = 0;	
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
IDENT	{ALPHA}(({DIGIT}|{ALPHA}|"_")*({DIGIT}|{ALPHA}))?
pound	[#]
space	[" "]
tab	[\t]
newline	[\n]
comment {pound}{pound}({tab}|{space})*.*{newline}
whitespace	({newline}|{tab}|{space})
ERROR1	.		
ERROR2  {NUMBER}{IDENT}
ERROR3	{IDENT}"_"
%%
   /* specific lexer rules in regex */

"function"	{printf("FUNCTION\n"); col += yyleng;}
"beginparams" 	{printf("BEGIN_PARAMS\n"); col += yyleng; }
"endparams"   	{printf("END_PARAMS\n"); col += yyleng; }
"beginlocals" 	{printf("BEGIN_LOCALS\n"); col += yyleng;}
"endlocals"   	{printf("END_LOCALS\n"); col += yyleng;}
"beginbody"   	{printf("BEGIN_BODY\n"); col += yyleng;}
"endbody"     	{printf("END_BODY\n"); col += yyleng;}
"integer"     	{printf("INTEGER\n"); col += yyleng;}
"array"       	{printf("ARRAY\n"); col += yyleng;}
"of"          	{printf("OF\n"); col += yyleng;}
"if"          	{printf("IF\n"); col += yyleng;}
"then"        	{printf("THEN\n"); col += yyleng;}
"endif"       	{printf("ENDIF\n"); col += yyleng;}
"else"        	{printf("ELSE\n"); col += yyleng;}
"while"       	{printf("WHILE\n"); col += yyleng;}
"do"          	{printf("DO\n"); col += yyleng;}
"for"         	{printf("FOR\n"); col += yyleng;}
"beginloop"   	{printf("BEGINLOOP\n"); col += yyleng;}
"endloop"     	{printf("ENDLOOP\n"); col += yyleng;}
"continue"    	{printf("CONTINUE\n"); col += yyleng;}
"read"        	{printf("READ\n"); col += yyleng;}
"write"       	{printf("WRITE\n"); col += yyleng;}
"and"         	{printf("AND\n"); col += yyleng;}
"or"          	{printf("OR\n"); col += yyleng;}
"not"         	{printf("NOT\n"); col += yyleng;}
"true"        	{printf("TRUE\n"); col += yyleng;}
"false"       	{printf("FALSE\n"); col += yyleng;}
"return"      	{printf("RETURN\n"); col += yyleng;}
";"		{printf("SEMICOLON\n"); col += yyleng;}
{colon}		{printf("COLON\n"); col += yyleng;}
","		{printf("COMMA\n"); col += yyleng;}
"("		{printf("L_PAREN\n"); col += yyleng;}
")"		{printf("R_PAREN\n"); col += yyleng;}
"["		{printf("L_SQUARE_BRACKET\n"); col += yyleng;}
"]"		{printf("R_SQUARE_BRACKET\n"); col += yyleng;}
{ASSIGN}	{printf("ASSIGN\n"); col += yyleng;}
{SUB}		{printf("SUB\n"); col += yyleng;}
{ADD}		{printf("ADD\n"); col += yyleng;}
{MULT}		{printf("MULT\n"); col += yyleng;}
{DIV}		{printf("DIV\n"); col += yyleng;}
{MOD}		{printf("MOD\n"); col += yyleng;}
{EQ}		{printf("EQ\n"); col += yyleng;}
{NEQ}		{printf("NEQ\n"); col += yyleng;}
{LT}		{printf("LT\n"); col += yyleng;}
{GT}		{printf("GT\n"); col += yyleng;}
{LTE}		{printf("LTE\n"); col += yyleng;}
{GTE}		{printf("GTE\n"); col += yyleng;}
{comment}	{printf("");}
{IDENT}		{printf("IDENT %s\n", yytext); col += yyleng;}
{NUMBER}	{printf("NUMBER %s\n", yytext); col += yyleng;}
{newline}	{line++; col = 0;}
{whitespace}	{col++;}
{ERROR1}	{printf("Error at line %d, column %d: unrecognized symbol \"%s\"\n", line, col, yytext); exit(1);}
{ERROR2}	{printf("Error at line %d, column %d: identifier \"%s\" must begin with a letter\n", line, col, yytext); exit(1);}
{ERROR3}	{printf("Error at line %d, column %d: identifier \"%s\" cannot end with underscore\n", line, col, yytext); exit(1);}

%%
	/* C functions used in lexer */

int main(int argc, char ** argv)
{
   yylex();
}
