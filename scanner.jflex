import java_cup.runtime.*;

{%
public Symbol Funstion1(int a)
{
    System.out.printf(" %14s (%-25s) at line %5d  column  %5d\n","Single Commit",yytext(),yyline,yycolumn);
    return new Symbol(a);
}
%}
%%

%cup
%unicode
%line
%column

digit=\d
Number=\d\d*
Decimal={Number}\.{Number}?
sl=\p{Lower}
cl=\p{Upper}
string=(\".*\")
relOp=(<|>|(<=)|(>=)|(\!=)|(==))
id=\w*
ops=(\+|\-|\/|\*|\%)
keyword=((int)|(string)|(for)|(if)|(main)|(println)|(scan)|(else)|(class)|(public)|(static)|(void)|(boolean)|(true)|(false)|(return)|(break)|(System)|(out))
MultiCommit=(\/\*\p{ASCII}*\*\/)
SingleCommit=(\/\/.*)
Character=(\'[{digit}{sl}{cl}]\')
ter=(\;)
lp=(\()
rp=(\))
lcb=(\{)
rcb=(\})
lsb=(\[)
rsb=(\])

// nl		=  \n|\r|\r\n
// intNumber	=  [1-9][0-9]

%%
// {intNumber}	{System.out.println("NUMBER:"+yytext());return new Symbol(sym.NUMBER);}

// "+"		{System.out.println("PLUS");return new Symbol(sym.PLUS);}
// "-"		{System.out.println("MINUS");return new Symbol(sym.MINUS);}


// "("		{System.out.println("OPEN BRACKET");return new Symbol(sym.OBRACKET);}
// ")"		{System.out.println("CLOSE BRACKET");return new Symbol(sym.CBRACKET);}

// "="		{System.out.println("EQUAL");return new Symbol(sym.EQUAL);}

// {nl}|" " 	{;}

// .		{System.out.println("Error:" + yytext());}

{SingleCommit} {Funstion1(sym.SINGLECOMMET);}
{MultiCommit} {System.out.printf(" %14s (%-25s) at line %5d  column  %5d\n","Multi Commit",yytext(),yyline,yycolumn);return new Symbol(sym.MULTICOMMIT);}
{ter} {System.out.printf(" %14s (%-25s) at line %5d  column  %5d\n","TER (",yytext(),yyline,yycolumn);return new Symbol(sym.TERMINATOR);}
{lp} {System.out.printf(" %14s (%-25s) at line %5d  column  %5d\n","Left (",yytext(),yyline,yycolumn);return new Symbol(sym.LP);}
{rp} {System.out.printf(" %14s (%-25s) at line %5d  column  %5d\n","Right )",yytext(),yyline,yycolumn);return new Symbol(sym.RP);}
{lcb} {System.out.printf(" %14s (%-25s) at line %5d  column  %5d\n","Left {",yytext(),yyline,yycolumn);return new Symbol(sym.LCB);}
{rcb} {System.out.printf(" %14s (%-25s) at line %5d  column  %5d\n","Right }",yytext(),yyline,yycolumn);return new Symbol(sym.RCB);}
{lsb} {System.out.printf(" %14s (%-25s) at line %5d  column  %5d\n","Left [",yytext(),yyline,yycolumn);return new Symbol(sym.LSB);}
{rsb} {System.out.printf(" %14s (%-25s) at line %5d  column  %5d\n","Right ]",yytext(),yyline,yycolumn);return new Symbol(sym.RSB);}
// {digit}   {System.out.printf(" %14s (%-25s) at line %5d  column  %5d\n","DIGIT",yytext(),yyline,yycolumn);return new Symbol(sym.DIGIT);}
{Decimal} {System.out.printf(" %14s (%-25s) at line %5d  column  %5d\n","DECIMAL",yytext(),yyline,yycolumn);return new Symbol(sym.DECIMAL);}
{Number}  {System.out.printf(" %14s (%-25s) at line %5d  column  %5d\n","NUMBER",yytext(),yyline,yycolumn);return new Symbol(sym.NUMBER);}
{ops}     {System.out.printf(" %14s (%-25s) at line %5d  column  %5d\n","OPS",yytext(),yyline,yycolumn);return new Symbol(sym.OPS);}
{relOp}   {System.out.printf(" %14s (%-25s) at line %5d  column  %5d\n","Rel Op",yytext(),yyline,yycolumn);return new Symbol(sym.RELOPS);}
{keyword} {System.out.printf(" %14s (%-25s) at line %5d  column  %5d\n","KEYWORD",yytext(),yyline,yycolumn);return new Symbol(sym.KEYWORD);}
{id}      {System.out.printf(" %14s (%-25s) at line %5d  column  %5d\n","IDENTIFIER",yytext(),yyline,yycolumn);return new Symbol(sym.ID);}
{string}  {System.out.printf(" %14s (%-25s) at line %5d  column  %5d\n","STRINGS",yytext(),yyline,yycolumn);return new Symbol(sym.STRING);}
{Character} { System.out.printf(" %14s (%-25s) at line %5d  column  %5d\n","CHARACTER",yytext(),yyline,yycolumn);return new Symbol(sym.CHAR);}
\n {}
. {}
