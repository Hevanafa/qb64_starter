$Debug

Const TARGET_FPS = 60
Const K_ESC = 27
Const WINDOW_WIDTH = 320
Const WINDOW_HEIGHT = 200
Const SCREEN_SCALE = 2

' Ref: https://qb64.com/wiki/SCREEN
Let buffer& = _NewImage(WINDOW_WIDTH, WINDOW_HEIGHT, 32)
Let scaled& = _NewImage(WINDOW_WIDTH * SCREEN_SCALE, WINDOW_HEIGHT * SCREEN_SCALE, 32)
Let cornflower_blue& = _RGB32(&H64, &H95, &HED)

Let qb64_logo& = _LoadImage("QB64.png", 32)

Screen scaled&
_Dest buffer&
_Delay 0.1
_Display

_Title "QB64 Starter"

' print text with transparent bg
_PrintMode _KeepBackground


Do
  _Limit TARGET_FPS

  Cls , cornflower_blue&

  Locate 3, 3
  Print "Hello QB64!"

  ' _PutImage (0, 0), qb64_logo&
  _PutImage ((WINDOW_WIDTH - _Width(qb64_logo&)) \ 2, (WINDOW_HEIGHT - _Height(qb64_logo&)) \ 2), qb64_logo&


  Locate 12, 1
  Print "Esc - quit";

  ' Apply the screen scaling
  _PutImage , buffer&, scaled&

  ' flush the display
  _Display
Loop Until _KeyDown(K_ESC)

' Turns off "Press any key to continue"
System

