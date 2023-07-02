   10 REM Boing!
   20 :
   30 REM Select double buffering mode (+128)
   40 MODE 128+2
   50 :
   60 REM Disable cursor
   70 VDU 23,1,0
   80 :
   90 REM Set text and graphic foreground and background colours
  100 VDU 17,128+7,17,5
  110 GCOL 0,5
  120 :
  130 REM Initialise variables for the ball
  140 BM%=1
  150 DA%=1
  160 X%=160
  170 DX%=2
  180 YA%=0
  190 REM Initialise Y-axis values
  200 PROC_bounce
  205 PROC_grid
  210 :
  220 REM Repeat forever
  230 REM 1. Update index into array of ball Y positions
  240 REM 2. Update ball bitmap (1 to 18)
  250 REM 3. Update X position of ball
  260 REM 4. Clear screen, draw shadow, grid, ball
  270 :
  280 REPEAT
  290   YA%=YA%+1:IF YA% > 119 THEN YA%=0
  300   BM%=BM%+DA%
  310   IF BM%>18 THEN BM%=1
  320   IF BM%<1 THEN BM%=18
  330   X%=X%+DX%
  340   IF X% > 195 THEN DX%=-DX%:DA%=-DA%
  350   IF X% < 5 THEN DX%=-DX%:DA%=-DA%
  360   VDU 12,23,27,0,19,23,27,3,X%+30;BN%(YA%);
  370   FOR I%=0 TO A%-1:VDU GR%(I%):NEXT I%
  380   VDU 23,27,0,BM%,23,27,3,X%;BN%(YA%);23,21
  390 UNTIL 0
  400 :
  410 END
  420 :
  500 DEF PROC_grid
  510 DIM GR%(600)
  520 A%=0
  530 FOR I%=0 TO 12
  540   PROC_plot(4,100,1023-I%*72)
  550   PROC_plot(5,1180,1023-I%*72)
  560 NEXT I%
  570 FOR I%=0 TO 15
  580   PROC_plot(4,100+I%*72,1023)
  590   PROC_plot(5,100+I%*72,159)
  600 NEXT I%
  610 FOR I%=0 TO 15
  620   PROC_plot(4,100+I%*72,159)
  630   PROC_plot(5,I%*85.333,63)
  640 NEXT I%
  650 PY%=884
  660 PX%=100-100*(PY%-864)/(960-864)
  670 PROC_plot(4,PX%,1023-PY%)
  680 PROC_plot(5,1280-PX%,1023-PY%)
  690 PY%=908
  700 PX%=100-100*(PY%-864)/(960-864)
  710 PROC_plot(4,PX%,1023-PY%)
  720 PROC_plot(5,1280-PX%,1023-PY%)
  730 PY%=936
  740 PX%=100-100*(PY%-864)/(960-864)
  750 PROC_plot(4,PX%,1023-PY%)
  760 PROC_plot(5,1280-PX%,1023-PY%)
  770 ENDPROC
  790 :
  800 DEF PROC_plot(M%,X%,Y%)
  810 GR%(A%)=25:A%=A%+1
  820 GR%(A%)=M%:A%=A%+1
  830 GR%(A%)=X% AND &FF:A%=A%+1
  840 GR%(A%)=X% / 256:A%=A%+1
  850 GR%(A%)=Y% AND &FF:A%=A%+1
  860 GR%(A%)=Y% / 256:A%=A%+1
  870 ENDPROC
  890 :
  900 DEF PROC_bounce
  910 DIM BN%(120)
  920 FOR I%=0 TO 119
  930   BN%(I%)=INT(100 - 90 * ABS(COS(I%*3*PI/180)))
  940 NEXT I%
  950 ENDPROC
