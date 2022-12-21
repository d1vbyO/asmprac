include e4.inc



;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
;                          СЕКЦИЯ КОДА
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

.code
start:
	push offset szTitle
	call SetConsoleTitleA@4
	;-----------------------
	call main
	;-----------------------
	push TEXT_COLOR
	call setColor
	;--------------
	push offset szExit
	call StdOut@4
	;-----------------------
	call quit
	;-----------------------
	push 0
	call ExitProcess@4
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
main proc
	call small
	ret
main endp

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
setColor proc
	push ebp
	mov ebp,esp
	;----------
	push ebx
	push esi
	push edi
	;----------
	push STD_OUTPUT_HANDLE
	call GetStdHandle@4
	;---------------------
	push dword ptr[ebp+8]
	push eax
	call SetConsoleTextAttribute@8
	;----------
	pop edi
	pop esi
	pop ebx
	mov esp,ebp
	pop ebp
	ret 4
setColor endp
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
pBuff 		equ [ebp+8]
cin proc
	push ebp
	mov ebp,esp
	;----------
	push edx
	push esi
	push edi
	;----------
	push MAX_SIZE
	push pBuff
	call StdIn@8
	;----------
	push pBuff
	call StripLF@4
	;----------
	pop edi
	pop esi
	pop ebx
	mov esp,ebp
	pop ebp
	
	ret 4
cin endp

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

lens proc
	push ebp
	mov ebp,esp
	
	push edx
	push esi
	push edi
	;----------начало строки
	xor eax,eax
	mov edi, dword ptr[ebp+8]
	mov ecx, 0ffffffffh
	;------------------------
	mov ebx,edi
	;------------------------
	repne scasb
	;------------------------
	sub edi,ebx
	dec edi
	;------------------------
	xor eax, edi
	xor edi,eax
	
	;----------
	pop edi
	pop esi
	pop ebx
	mov esp,ebp
	pop ebp
	
	ret 4
lens endp
	
lens2 proc

	push ebp
	mov ebp,esp
	
	push edx
	push esi
	push edi
	;----------начало строки
	xor eax,eax
	mov edi, dword ptr[ebp+8]
	or ecx, 0ffffffffh
	;------------------------
	repne scasb
	;------------------------
	not ecx
	dec ecx
	;------------------------
	xor eax,ecx
	xor ecx,eax
	;----------
	pop edi
	pop esi
	pop ebx
	mov esp,ebp
	pop ebp
	
	ret 4
lens2 endp




small proc
	enter 0,0
	;----------
	add esp, -4
	;----------
	push ebx
	push esi
	push edi
	;----------
	push STD_OUTPUT_HANDLE
	call GetStdHandle@4
	;--------------------
	mov dword ptr[ebp-4],eax
	xor ebx,ebx
_do:
	mov eax,dword ptr[ebp-4]
	;-----------------------
	push ebx
	push eax
	call SetConsoleTextAttribute@8
	;-----------------------------
	push ebx;цвет
	push offset szFrm
	push offset szBuffer
	call wsprintfA
	;-------------------
	add esp, 12
	;----------
	push offset szBuffer
	call StdOut@4
	;-------------------
	inc ebx
	;------
	test bl,0fh
	jnz _while
	;-----------------
	push offset szNewL
	call StdOut@4
_while:
	cmp bx,0ffh
	jbe _do
	;----------
	pop edi
	pop esi
	pop ebx
	;----------
	leave
	;----------
	ret
small endp

quit proc
	push ebp
	mov ebp,esp
	;--------------
	add esp, -8
	;--------------
	push edx
	push esi
	push edi
	;--------------------
	push STD_INPUT_HANDLE
	call GetStdHandle@4
	;---------------------
	mov ebx,eax
	push 0
	push eax
	;---------------------
	call SetConsoleMode@8
	;---------------------
	push 0
	lea esi,[ebp-8]
	push esi
	;---------------------
	push 1
	lea esi,[ebp-4]
	push esi
	push ebx
	call ReadConsoleA@20
	;----------------------
	pop edi
	pop esi
	pop ebx
	mov esp,ebp
	ret
	
	
		
	
	
	
	
	

quit endp
;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
end start