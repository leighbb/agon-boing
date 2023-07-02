   10 REM Load the 19 images (this will take a long time)
   20 :
   30 REM Load the 19 bitmaps
   40 FOR I%=1 TO 19
   50   NM$="BOING"
   60   IF I% < 10 THEN NM$=NM$+"0"
   70   NM$=NM$+STR$(I%)+".DAT"
   80   IF I% = 19 THEN NM$="SHADOW.DAT"
   90   PRINT"Loading bitmap from '";NM$;"'"
  100   :
  110   F=OPENIN NM$
  120   INPUT#F,H%,W%
  130   :
  140   REM Select Bitmap I%
  150   VDU 23,27,0,I%
  160   :
  170   REM Load ARGB2222 data into bitmap
  180   VDU 23,27,129,H%;W%;
  190   FOR J%=1 TO H%*W%/10
  200     INPUT#F,P0%,P1%,P2%,P3%,P4%,P5%,P6%,P7%,P8%,P9%
  205     VDU P0%,P1%,P2%,P3%,P4%,P5%,P6%,P7%,P8%,P9%
  210   NEXT J%
  220   CLOSE#F
  230   :
  240 NEXT I%
  250 :
  260 PRINT "All done!"
  270 :
  280 CHAIN "BOING.BAS"
  290 END
