
package mini_turtle;

import java_cup.runtime.*;
import java.util.*;
import static mini_turtle.sym.*;

%%

%class Lexer
%unicode
%cup
%cupdebug
%line
%column
%yylexthrow Exception

/* The symbols produced by the lexical analyzer not just integers, but objects
   of type java_cup.runtime.Symbol. To create such an object, one invokes the
   function symbol(), defined below, and supplies an integer constant, which
   identifies a terminal symbol; if necessary, one also supplies a semantic
   value, of an appropriate type -- this must match the type declared for this
   terminal symbol in Parser.cup. */

/* See https://www2.in.tum.de/repos/cup/develop/src/java_cup/runtime/ */

/* Technical note: CUP seems to assume that the two integer parameters
   passed to the Symbol constructor are character counts for the left
   and right positions. Instead, we choose to provide line and column
   information. Accordingly, we will replace CUP's error reporting
   routine with our own. */

%{

    private Symbol symbol(int id)
    {
	return new Symbol(id, yyline, yycolumn);
    }

    private Symbol symbol(int id, Object value)
    {
	return new Symbol(id, yyline, yycolumn, value);
    }

%}
LineTerminator     = \r | \n | \r\n
InputCharacter     = [^\r\n]
WhiteSpace         = [ \t\f\r\n]
String             = "\"" [^\"]* "\""

Comment            = "//" {InputCharacter}* {LineTerminator}

Identifier         = [:jletter:] [:jletterdigit:]*

Integer            = [:digit:]+

%state COMMENT

%%

/* A specification of which regular expressions to recognize and what
   symbols to produce. */

<YYINITIAL> {

    "+"
    { return symbol(PLUS); }

    "-"
    { return symbol(MINUS); }

    "*"
    { return symbol(TIMES); }

    "/"
    { return symbol(DIV); }

    "("
    { return symbol(LPAREN); }

    ")"
    { return symbol(RPAREN); }

    "{"
    { return symbol(BEGIN); }

    "}"
    { return symbol(END); }

    ","
    { return symbol(COMMA); }

    "if"
    { return symbol(IF); }

    "else"
    { return symbol(ELSE); }

    "def"
    { return symbol(DEF); }

    "repeat"
    { return symbol(REPEAT); }

    "penup"
    { return symbol(PENUP); }

    "pendown"
    { return symbol(PENDOWN); }

    "forward"
    { return symbol(FORWARD); }

    "turnleft"
    { return symbol(TURNLEFT); }

    "turnright"
    { return symbol(TURNRIGHT); }

    "color"
    { return symbol(COLOR); }

    "black"
    { return symbol(BLACK); }

    "white"
    { return symbol(WHITE); }

    "red"
    { return symbol(RED); }

    "green"
    { return symbol(GREEN); }

    "blue"
    { return symbol(BLUE); }

    {Identifier}
    { return symbol(IDENT, yytext().intern()); }
    // The call to intern() allows identifiers to be compared using == .

    {Integer}
    { return symbol(CST, Integer.parseInt(yytext())); }

    {Comment}
    { /* ignore */ }

    "(*"
    { yybegin(COMMENT); }

    {WhiteSpace}
    { /* ignore */ }

    .
    { throw new Exception (String.format (
        "Line %d, column %d: illegal character: '%s'\n", yyline, yycolumn, yytext()
      ));
    }

}

<COMMENT> {
      "*)"         { yybegin(YYINITIAL); }
      {WhiteSpace} { /* ignore */ }
      .            { /* ignore */ }
      <<EOF>>    { throw new Exception(String.format(
        "Line %d, column %d: unclosed comment\n", yyline, yycolumn)); }
}
