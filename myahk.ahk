#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
 
;{{{ Anne pro special
;Light Win+7 or 8
#7::
  AdjustScreenBrightness(-3)
  Return

#8::
  AdjustScreenBrightness(3)
  Return
  
;Sound Win+9 or 0
#9::
    Send {Volume_Down}
Return
#0::
    Send {Volume_Up}
Return

AdjustScreenBrightness(step) {
    service := "winmgmts:{impersonationLevel=impersonate}!\\.\root\WMI"
    monitors := ComObjGet(service).ExecQuery("SELECT * FROM WmiMonitorBrightness WHERE Active=TRUE")
    monMethods := ComObjGet(service).ExecQuery("SELECT * FROM wmiMonitorBrightNessMethods WHERE Active=TRUE")
    minBrightness := 5  ; level below this is identical to this

    for i in monitors {
        curt := i.CurrentBrightness
        break
    }
    if (curt < minBrightness)  ; parenthesis is necessary here
        curt := minBrightness
    toSet := curt + step
    if (toSet > 100)
        return
    if (toSet < minBrightness)
        toSet := minBrightness
        
    

    for i in monMethods {
        i.WmiSetBrightness(1, toSet)
        break
    }
}

;}}}

; CapsLock & ...{{{
;copy path
CapsLock & c:: 
Send,^c 
Sleep,200 
Clipboard=%clipboard%
Tooltip,%clipboard% 
Sleep,3000 
Tooltip, 
Return
;;==CapsLock -> Esc==;;
;CapsLock::Send, {ESC}
;return
;CapsLock & Space::
;if getkeystate("capslock","T")=1
;    SetCapsLockState, Off
;else
;    SetCapsLockState, On
;Return

;===========================;H --> Left
CapsLock & h::
if getkeystate("shift") = 0
Send, {Left}
else
Send, +{Left}
return
;===========================;J --> Down
CapsLock & j::
if getkeystate("shift") = 0
Send, {Down}
else
Send, +{Down}
return
;===========================;K --> UP
CapsLock & k::
if getkeystate("shift") = 0
Send, {Up}
else
Send, +{Up}
return
;===========================;L --> Right
CapsLock & l::
if getkeystate("shift") = 0
Send, {Right}
else
Send, +{Right}
return

CapsLock & `;::Send, {PgUp}
CapsLock & '::Send, {PgDn}
CapsLock & [::Send, {Home}
CapsLock & ]::Send, {End}
;;===============left up==================;;
;;;------------------;;;
CapsLock & r:: Send, {LWin down}{Right}{LWin up}
return
CapsLock & d:: Send, {LWin down}{Up}{LWin up}
return
CapsLock & f:: Send, {LWin down}{Down}{LWin up}
return
;;;----------------????Tag???-----;;;
CapsLock & s:: Send, ^{Tab}             ; Switch Tag    S = {Ctr + Tab}
CapsLock & w:: Send, ^w                 ; Close Tag     W = {Ctr + W}
CapsLock & q:: Send, !{F4}              ; Close Window  Q = {Alt + F4}

;;; ----------------dict-----------------------
;CapsLock & z::
;send ^c
;sleep 10
;url := "https://www.vocabulary.com/dictionary/" . clipboard
;if(strlen(url)<100)
;{
;run chrome.exe --app=%url% 
;}
;return
; }}}

;;French {{{
:?*:e/f::{U+E9} ;'?' mean even if the hotstring appear in the word, it will immediately turn to the alternate.
:?*:e\f::{U+E8}
:?*:e^f::{U+EA}
:?*:csf::{U+E7}
:?*:i''f::{U+EF}
:?*:i^f::{U+EE}
:?*:u^f::{U+FB}
:?*:u\f::{U+F9}
:?*:u''f::{U+FC}
:?*:o^f::{U+F4}
:?*:a\f::{U+E0}
:?*:a^f::{U+E2}
:?*:oef::{U+153}
; }}}

;;*********Application***************;;{{{
::/qq::
run C:\Program Files (x86)\Tencent\QQ\Bin\QQ.exe
msgbox, , , Activated!, 0.5
return

::/m::
run C:\Program Files (x86)\Netease\CloudMusic\cloudmusic.exe
msgbox, , , Activated!, 0.5
return

::/anki::
run C:\Users\zsy\Desktop\Anki.lnk
msgbox, , , Activated!, 0.5
return

::/dosbox::
run C:\Users\Public\Desktop\DOSBox 0.74.lnk
msgbox, , , Activated!, 0.5
return

::/n::
run C:\Users\zsy\Desktop\Evernote.lnk
msgbox, , , Activated!, 0.5
return

;::/vsc::
;run C:\Users\Public\Desktop\Visual Studio Code.lnk
;return

;::/vs::
;run C:\Users\zsy\Desktop\VS2015.lnk
;return

;::/bash::
;run C:\Users\Public\Desktop\Git Bash.lnk
;return

::/ch::
run C:\Users\Public\Desktop\Google Chrome.lnk
msgbox, , , Activated!, 0.5
return

::/dw::
run C:\Users\zsy\Desktop\Dreamweaver CS6.lnk
msgbox, , , Activated!, 0.5
return

::/ahk::
run C:\Program Files\AutoHotkey\AutoHotkey.exe
msgbox, , , Activated!, 0.5
return

::/bdwp::
run C:\Users\zsy\Desktop\bdwp.lnk
msgbox, , , Activated!, 0.5
return

;::/lt::
;run C:\Users\zsy\Desktop\Lantern.lnk
;return

::/dict::
run C:\Program Files (x86)\Microsoft Bing Dictionary\BingDict.exe
msgbox, , , Activated!, 0.5
return

::/frdict::
run http://www.frdic.com/
msgbox, , , Activated!, 0.5
return

::/blbl::
run https://www.bilibili.com/
msgbox, , , Activated!, 0.5
return

::/cc::
run C:\Users\Public\Desktop\CCleaner.lnk
msgbox, , , Activated!, 0.5
return

CapsLock & v::
Run, C:\Program Files (x86)\Vim\vim80\gvim.exe, , Max
return

::/cmd::
Run  C:\Users\zsy\Downloads\cmd_markdown_win64\cmd_markdown_win64\Cmd Markdown.exe
msgbox, , , Activated!, 0.5
return

;Often changing:

CapsLock & x::
run C:\Users\zsy\Desktop\root.lnk
return

CapsLock & z::
Run, firefox.exe
Return

CapsLock & a::
Run, C:\Users\zsy\projects
Return
; }}}

;====================HotString======================;
:*?:/mm/::zhang19980918

; YdDict Special{{{
CapsLock & e::
IfWinExist, YdDictMiniWnd
{
WinActivate
return
}
Return
; }}}
