$Debug
$ExeIcon:'./qb64pe.ico'

Option _Explicit
' Make it like Lua
Option Base 1

Const TARGET_FPS = 60
Const WINDOW_WIDTH = 240
Const WINDOW_HEIGHT = 136
Const SCREEN_SCALE = 3

' List keys in use
Const K_ESC = 27

' Prepare the screen
' Ref: https://qb64.com/wiki/SCREEN
Dim buffer, scaled
buffer = _NewImage(WINDOW_WIDTH, WINDOW_HEIGHT, 32)
scaled = _NewImage(WINDOW_WIDTH * SCREEN_SCALE, WINDOW_HEIGHT * SCREEN_SCALE, 32)
Screen scaled: _Dest buffer: _Delay 0.1: _Display

' 32-bit colours should be used after changing the screen mode
Dim qb64_logo
qb64_logo = _LoadImage("qb64pe.png", 32)

Dim As Long cornflower_blue, white
cornflower_blue = _RGB32(&H64, &H95, &HED) ' &hFF6495ED
white = _RGB32(&HFF, &HFF, &HFF)

_Title "QB64 Starter"

' print text with transparent bg
_PrintMode _KeepBackground

_Font 8

Do
  _Limit TARGET_FPS

  Cls , cornflower_blue&

  _PutImage ((WINDOW_WIDTH - _Width(qb64_logo)) \ 2, (WINDOW_HEIGHT - _Height(qb64_logo)) \ 2), qb64_logo

  _PrintString (24, 20), "Hello QB64!"

  Locate 16, 1
  Print "Esc - quit";

  ' Apply the screen scaling
  _PutImage , buffer, scaled

  ' Flush the display
  _Display
Loop Until _KeyDown(K_ESC)

' Turns off "Press any key to continue"
System

