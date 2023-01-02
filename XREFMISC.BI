TYPE FileViewInfo

    Colr        AS INTEGER      '7      ;Text color (white on black default)
    ULRow       AS INTEGER      '1      ;window's corners
    ULCol       AS INTEGER      '1
    LRRow       AS INTEGER      '25
    LRCol       AS INTEGER      '80
    HorizOffset AS INTEGER      '0      ;Horizontal offset for display (scrolling)
    LoPtr       AS INTEGER      '0      ;set SI to this for the first screen line
    FileHandle  AS INTEGER      '0      ;Use for saving file handle
    EndOfFile   AS INTEGER      '-1     ;Points within buffer
    LineNumber  AS LONG         '1      ;Line No of the top line
    BufferMid   AS INTEGER      '16384  ;midpoint of the buffer in bytes
    FileSeek    AS LONG         '0      ;absolute file LOC to begin display (polled only!)
    FileOffset  AS LONG         '-1     ;Address within file of buffer data

END TYPE