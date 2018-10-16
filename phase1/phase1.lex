%{
	int currLine = 1;
	int currPos = 1;
%}

/* Reserved Words */
FUNCTION "function"
BEGIN_PARAMS "beginparams"
END_PARAMS "endparams"
BEGIN_LOCALS "beginlocals"
END_LOCALS "endlocals"
BEGIN_BODY "beginbody"
END_BODY "endbody"
INTEGER "integer"
ARRAY "array"
OF "of"
IF "if"
THEN "then"
ENDIF "endif"
ELSE "else"
WHILE "while"
DO "do"
BEGINLOOP "beginloop"
ENDLOOP "endloop"
CONTINUE "continue"
READ "read"
WRITE "write"
AND "and"
OR "or"
NOT "not"
TRUE "true"
FALSE "false"
RETURN "return"

/* Arithmetic Operators */
SUB "-"
ADD "+"
MULT "*"
DIV "/"
MOD "%"

/* Comparison Operators */
EQ "=="
NEQ "<>"
LT "<"
GT ">"
LTE "<="
GTE ">="

/* Identifiers and Numbers */

letter [a-zA-Z]
digit [0-9]
NUMBER {digit}+
IDENTIFIER {letter}({letter}|{digit}|([_]({letter}|{digit})))*
NEWLINE "\n"
COMMENT [#][#].*

/* Other Special Symbols */
SEMICOLON ";"
COLON ":"
COMMA ","
L_PAREN "("
R_PAREN ")"
L_SQUARE_BRACKET "["
R_SQUARE_BRACKET "]"
ASSIGN ":="

/*The errors that we are supposed to throw*/
DOUBLE_UNDERSCORE [_][_]
QUESTION_MARK "?"



%%

{AND} {
	printf("AND\n");
	currPos += yyleng;
}

{CONTINUE} {
	printf("CONTINUE\n");
	currPos += yyleng;
}

{WHILE} {
	printf("WHILE\n");
	currPos += yyleng;
}


{BEGIN_PARAMS} {
	printf("BEGIN_PARAMS\n");
	currPos += yyleng;
}


{BEGINLOOP} {
	printf("BEGINLOOP\n");
	currPos += yyleng;
}

{ENDLOOP} {
	printf("ENDLOOP\n");
	currPos += yyleng;
}


{NUMBER}+ {
	printf("NUMBER %s\n", yytext);
	currPos += yyleng;
}

{L_PAREN} {
	printf("L_PAREN\n");
	currPos += yyleng;
}

{R_PAREN} {
	printf("R_PAREN\n");
	currPos += yyleng;
}

{L_SQUARE_BRACKET} {
	printf("L_SQUARE_BRACKET\n");
	currPos += yyleng;
}

{R_SQUARE_BRACKET} {
	printf("R_SQUARE_BRACKET\n");
	currPos += yyleng;

}

{SUB} {
	printf("SUB\n");
	currPos += yyleng;
}

{ADD} {
	printf("ADD\n");
	currPos += yyleng;
}

{DIV} {
	printf("DIV\n");
	currPos += yyleng;
}

{MULT} {
	printf("MULT\n");
	currPos += yyleng;
}

{EQ} {
	printf("EQ\n");
	currPos += yyleng;
}


[ ]  {
	currPos += yyleng;
}

[ \t]+ {
	/* ignore spaces*/
	currPos += yyleng;
}

{COMMENT} {
	currLine +=1;
	currPos = 1;
}

{NEWLINE} {
	currLine +=1;
	currPos = 1;
}

{FUNCTION} {
	printf("FUNCTION\n");
	currPos += yyleng;
}

{ASSIGN} {
	printf("ASSIGN\n");
	currPos += yyleng;
}


{SEMICOLON} {
	printf("SEMICOLON\n");
	currPos += yyleng;
}

{COLON} {
	printf("COLON\n");
	currPos += yyleng;
}


{COMMA} {
	printf("COMMA\n");
	currPos += yyleng;
}

{END_PARAMS} {
	printf("END_PARAMS\n");
	currPos += yyleng;
}

{BEGIN_LOCALS} {
	printf("BEGIN_LOCALS\n");
	currPos += yyleng;
}

{END_LOCALS} {
	printf("END_LOCALS\n");
	currPos += yyleng;
}

{BEGIN_BODY} {
	printf("BEGIN_BODY\n");
	currPos += yyleng;
}

{END_BODY} {
	printf("END_BODY\n");
	currPos += yyleng;
}

{IF} {
	printf("IF\n");
	currPos += yyleng;
}

{OF} {
	printf("OF\n");
	currPos += yyleng;
}

{ELSE} {
	printf("ELSE\n");
	currPos += yyleng;
}


{OR} {
	printf("OR\n");
	currPos += yyleng;
}



{FALSE} {
	printf("FALSE\n");
	currPos += yyleng;
}


{DO} {
	printf("DO\n");
	currPos += yyleng;
}

{ENDIF} {
	printf("ENDIF\n");
	currPos += yyleng;
}

{GTE} {
	printf("GTE\n");
	currPos += yyleng;
}

{LTE} {
	printf("LTE\n");
	currPos += yyleng;
}
{MOD} {
	printf("MOD\n");
	currPos += yyleng;
}

{LT} {
	printf("LT\n");
	currPos += yyleng;
}

{GT} {
	printf("GT\n");
	currPos += yyleng;
}

{INTEGER} {
	printf("INTEGER\n");
	currPos += yyleng;
}



{THEN} {
	printf("THEN\n");
	currPos += yyleng;
}

{RETURN} {
	printf("RETURN\n");
	currPos += yyleng;
}

{READ} {
	printf("READ\n");
	currPos += yyleng;
}

{WRITE} {
	printf("WRITE\n");
	currPos += yyleng;
}

{ARRAY} {
	printf("ARRAY\n");
	currPos += yyleng;
}



[0-9|_][a-zA-Z0-9|_]*[a-zA-Z0-9|_] {
	printf("Error at line %d, column %d: Identifier \"%s\" must begin with a letter\n",currLine,currPos,yytext);
	currPos += strlen(yytext);
	exit(0);
}
[a-zA-Z][a-zA-Z0-9|_]*[_] {
	printf("Error at line %d, column %d: Identifier \"%s\" cannot end with an underscore\n",currLine,currPos,yytext);
	currPos += strlen(yytext);
	exit(0);
}

{IDENTIFIER} {
	printf("IDENT %s\n", yytext);
}


. {
	printf("Error at line %d, column %d: unrecognized symbol \"%s\"\n", currLine, currPos, yytext);
	exit(0);
}

%%
/* user code*/

int main(int argc, char ** argv) {

	yylex();

}
