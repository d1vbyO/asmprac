.686p
.model flat,stdcall
option casemap:none

includelib D:\masm32\lib\kernel32.lib
includelib D:\masm32\lib\masm32.lib
includelib D:\masm32\lib\user32.lib
;-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=-==-
extern WriteConsoleA@20:near
extern GetStdHandle@4:near
extern ExitProcess@4:near
extern ReadConsoleA@20:near
extern StdOut@4:near
extern StdIn@8:near
extern StripLF@4:near
extern SetConsoleMode@8:near
extern SetConsoleTitleA@4:near
extern SetConsoleTextAttribute@8:near
extern wsprintfA:near
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
.const
MAX_SIZE 				equ 255
STD_INPUT_HANDLE		equ -10
STD_OUTPUT_HANDLE		equ -11
;------------------------------------
FOREGROUND_BLUE                      equ 1h
FOREGROUND_GREEN                     equ 2h
FOREGROUND_RED                       equ 4h
FOREGROUND_INTENSITY                 equ 8h
BACKGROUND_BLUE                      equ 10h
BACKGROUND_GREEN                     equ 20h
BACKGROUND_RED                       equ 40h
BACKGROUND_INTENSITY                 equ 80h
;--------------------------------------------

TEXT_COLOR		equ	 40h



.data?


.data
	szBuffer 	db MAX_SIZE dup(0)
	szExit		db "Press any key...",0
	szTitle 	db "SetConsoleTextAttribute demo",0
	szAsking	db "Enter a line: ",13,10,0
	szFrm 		db " %.2X",0
	szNewL		db 13,10
	