'********** REPLACE.BAS

' Replaces all occurences of one string with another without regard to capitalization

' Original by Ethan Winer 1988
' Updated by Cory Smith 2022

DEFINT A-Z

'DECLARE SUB ReplaceString (Work$, Old$, New$)
'DECLARE SUB ReplaceChar (Work$, Old$, New$)
'DECLARE SUB ReplaceChar2 (Work$, Old$, New$)
'DECLARE FUNCTION QInstr2 (Start%, Str1$, Str2$)

CLS

Work$ = "This is a test of the Replace function in QuickPak Professional."
Old$ = "this"
New$ = "And now this"

PRINT Work$
ReplaceString2 Work$, Old$, New$
PRINT Work$

PRINT
Work$ = "Now let's replace only single characters at assembler speed!"
PRINT Work$
ReplaceChar Work$, "n", "m"
PRINT Work$
PRINT

Work$ = "And finally replace all characters regardless of capitalization."
PRINT Work$
ReplaceChar2 Work$, "a", "e"
PRINT Work$

'$INCLUDE: 'QPPRO.BAS'
