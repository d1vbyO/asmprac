.686
.model flat,stdcall
option casemap:none

comment*===================================
		Console Color Template
===========================================*

include D:\masm32\include\kernel32.inc
include D:\masm32\include\masm32.inc
include D:\masm32\include\msvcrt.inc

include D:\masm32\macros\macros.asm

includelib D:\masm32\lib\kernel32.lib
includelib D:\masm32\lib\masm32.lib
includelib D:\masm32\lib\msvcrt.lib
;-------------------------------------------

Quit 		proto 
SetColor 	proto :DWORD, DWORD
.const


.data?


.data


.code
start:
	fn SetConsoleTitle, "Test macroses"
	;-----------------------------------
	call main
	;-----------------------------------
	invoke Quit
	;-----------------------------------
	invoke ExitProcess,0


;---------------------------------------
main proc
	invoke crt_puts, chr$("Hello wrld!")

	ret
main endp

;---------------------------------------


Quit proc

	szText szExit,"Press any key..."
	;-------------------------------
	ccout(offset szExit)
	;-------------------------------
	_while:
		test FUNC(crt__kbhit),eax
		;------------------------
		je _while
		;---------------
		invoke crt__getch

	ret
Quit endp
;---------------------------------------
SetColor proc uses ebx esi edi color:DWORD,cBk:DWORD 
	xor ebx,ebx
	mov bl,byte ptr[cBk]
	;-------------------
	shl bl,4
	;-------------------
	
	
	
	ret
SetColor endp
;---------------------------------------
end start