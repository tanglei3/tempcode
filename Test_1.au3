#Include-Once                                      ;-+
#Include "_Dbug.au3"                               ; |
Opt('MustDeclareVars', 1)                          ; |
                                                   ; |
Dim $a[10]   = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]     ; |
Dim $b[1]    = ["Is Test"]                         ; |
Dim $c[1][2] = [["This!", $b]]                     ; |
																	; | Scope "Global"
$a[7] = $c                                         ; |
$a[8] = DllStructCreate('int[2];')                 ; |
$a[9] = ObjCreate("shell.application")             ; |
                                                   ; |
_test()                                            ; |
ConsoleWrite('+++> @Error = ' & @Error & _ ; test  ; |
		'  @Extended = ' & @Extended & @CRLF)        ; |
                                                   ; |
Func _test()                                       ;-+
	Local $sValue = $b[0]                           ;-+
	$a[1] = $c                                      ; | Scope function "_test"
	Return SetError(1, 2)                           ; |
EndFunc                                            ;-+
                                                   ;-+
Exit                                               ; | Scope "Global"
                                                   ;-+