'****************************************************************************
'MAKEKEYS.BAS - Program that creates the XREF.KEY file for XREF.EXE.
'
'  The XREF.KEY file contains a list of all BASIC's keywords.
'
'  To create the above file, run this program.  To modify keyword
'  information, edit the KEYWORDS.BI include file and then rerun
'  this program.
'****************************************************************************

DEFINT A-Z

'$INCLUDE: '../QuickPakPro/QB64/QPPRO.BI'

_TITLE "Dialog Box Input Routines"
'_FULLSCREEN _SQUAREPIXELS

DECLARE FUNCTION XRFindKey% (SEG Element AS ANY, NumKeyWords)

CONST NumKeyWords = 388

TYPE KeyWords
   KName AS STRING * 17
   KFlag AS INTEGER
END TYPE

DECLARE SUB FClose (Handle%)
DECLARE SUB FCreate (FileName$)
DECLARE SUB FOpen (FileName$, Handle%)
DECLARE SUB FPutA (Handle%, SEG Element AS ANY, NumBytes&)

KWords:
'$INCLUDE: 'KeyWords.bi'

REDIM KWord(1 TO NumKeyWords) AS KeyWords
KWord(1).KName = CHR$(34)
RESTORE KWords
FOR N = 2 TO NumKeyWords
    READ KWord(N).KName, KWord(N).KFlag
NEXT

' Totally confused right now regarding how _MEM is supposed to work.

DIM m1 AS _MEM: m1 = _MEM(KWord())
PRINT m1.OFFSET
PRINT m1.SIZE '<-- expecting 7372, get 7372.
PRINT m1.TYPE
_MEMFREE m1
PRINT
DIM m2 AS _MEM: m2 = _MEM(KWord(1))
PRINT m2.OFFSET
PRINT m2.SIZE '<-- expecting 19, get 7372.
PRINT m2.TYPE
_MEMFREE m2
PRINT
DIM m3 AS _MEM: m3 = _MEM(KWord(1).KName)
PRINT m3.OFFSET
PRINT m3.SIZE '<-- expecting 17, get 7372.
PRINT m3.TYPE
_MEMFREE m3
PRINT

END

CLS
FOR N = 1 TO NumKeyWords
   KWord(0).KName = KWord(N).KName
   BWord = XRFindKey%(KWord(), NumKeyWords)
   IF BWord = 0 THEN
      PRINT KWord(N).KName; "is out of order"
   END IF
NEXT

FCreate "XRef.Key"
FOpen "XRef.Key", Handle%
DIM m AS _MEM: m = _MEM(KWord) ' <--- well, this sucks; can't inline the creation of this - will have to look into improving QB64 to allow for this.
FPutA Handle%, m, NumKeyWords * LEN(KWord(0))
FClose Handle%

FUNCTION XRFindKey% (ar() AS KeyWords, NumKeyWords)
  XRFindKey% = 0
END FUNCTION

'$INCLUDE: '..\QuickPakPro\QB64\QPPRO.BAS'