DEFINT A-Z

CONST UBSymbols = 2200
CONST MaxCmn = 1000

CONST Comma = 44                        'Need I say more
CONST Period = 46
CONST Colon = 58
CONST OpenParen = 40
CONST CloseParen = 41

TYPE KeyWords                           'Used to hold BASIC key words
   KName AS STRING * 17                 'Keyword name
   KFlag AS INTEGER                     'Floating point or P.D.Q. flag
END TYPE

TYPE WordInfo                           'Holds parsed words from a line
   Word AS STRING * 40 'NameLen             'Space for the word
   Length AS INTEGER                    'Length of the word
   BasicWord AS INTEGER                 'Flags a BASIC key word
END TYPE

TYPE SymbolInfo
   RecNo AS INTEGER
   Global AS INTEGER
   LastRef AS LONG
END TYPE

TYPE BASICWordNumber
   As1              AS INTEGER
   AsCurrency      AS INTEGER
   AsDouble        AS INTEGER
   AsInteger       AS INTEGER
   AsLong          AS INTEGER
   AsSingle        AS INTEGER
   AsString        AS INTEGER
   Colon           AS INTEGER
   Common1          AS INTEGER
   CommonShared    AS INTEGER
   Const1           AS INTEGER
   Call1            AS INTEGER
   Calls           AS INTEGER
   DeclareFunction AS INTEGER
   DeclareSub      AS INTEGER
   Def1             AS INTEGER
   DefCur          AS INTEGER
   DefDbl1          AS INTEGER
   DefInt1          AS INTEGER
   DefLng1          AS INTEGER
   DefSng1          AS INTEGER
   DefStr1          AS INTEGER
   Dim1             AS INTEGER
   DimShared       AS INTEGER
   Else1            AS INTEGER
   ElseIf1          AS INTEGER
   EndDef          AS INTEGER
   EndFunction     AS INTEGER
   EndSub          AS INTEGER
   EndType         AS INTEGER
   Equals          AS INTEGER
   Erase           AS INTEGER
   ErlEqu          AS INTEGER
   Field           AS INTEGER
   For1             AS INTEGER
   ForISAM         AS INTEGER
   Function1        AS INTEGER
   Get1             AS INTEGER
   Gosub1           AS INTEGER
   Goto1            AS INTEGER
   If1              AS INTEGER
   Input1           AS INTEGER
   Is1              AS INTEGER
   LBound          AS INTEGER
   Line            AS INTEGER
   LineInput       AS INTEGER
   LineStep        AS INTEGER
   Lset            AS INTEGER
   Mid1             AS INTEGER
   Put1             AS INTEGER
   ReDim1           AS INTEGER
   ReDimPreserve   AS INTEGER
   ReDimShared     AS INTEGER
   Restore         AS INTEGER
   Resume          AS INTEGER
   Return          AS INTEGER
   Run             AS INTEGER
   Rset            AS INTEGER
   Shared1          AS INTEGER
   Static1          AS INTEGER
   Step1            AS INTEGER
   Sub1             AS INTEGER
   Swap            AS INTEGER
   Then1            AS INTEGER
   Type            AS INTEGER
   UBound          AS INTEGER
   UnScore         AS INTEGER
END TYPE

REDIM KWord(0) AS KeyWords              'Create the keyword array.  Allocated
                                        '  later
REDIM IncNos(0)                         'Ditto for include file handles

REDIM Words(0) AS WordInfo              'Reserve space for the parsed words

REDIM Symbol$(0)
REDIM SmbInfo(0) AS SymbolInfo
REDIM ObjBuffer(1 TO 1) AS ObjectInfo
REDIM RefBuffer(1 TO 1) AS ReferenceInfo
REDIM TxtBuf$(0, 0), Header$(0)

DIM SHARED AbortMsg$