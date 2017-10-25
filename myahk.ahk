#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;;------------------------Anne pro -------------------------;;
;;------------------------------------------------------------------;;
;;------------------------------------------------------------------;;
;;------------------------------------------------------------------;;

;禁用大写锁定
;SetCapsLockState alwaysoff

;亮度Win+7 or 8
#7::
  AdjustScreenBrightness(-3)
  Return

#8::
  AdjustScreenBrightness(3)
  Return
  
;声音Win+9 or 0
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

;复制路径Ctrl+Shift+c
^+c:: 
Send,^c 
Sleep,200 
Clipboard=%clipboard%
Tooltip,%clipboard% 
Sleep,3000 
Tooltip, 
Return

;;==============CapsLock????===================;;
;;=================================================;;
;;=================================================;;
;;=================================================;;
;;=================================================;;
;;=================================================;;
;;=================================================;;

;;==??ESC???alt+capslock?????==;;
CapsLock::Send, {ESC}
return
!CapsLock::
if getkeystate("capslock","T")=1
    SetCapsLockState, Off
else
    SetCapsLockState, On
Return

;;===============????????==================;;u h b ??
;;;-------------------???

;CapsLock & u:: Send, {+}   ; uiop --> +-=_
;CapsLock & i:: Send, -     ;
;CapsLock & o:: Send, =     ;
;CapsLock & p:: Send, _     ;
;CapsLock & [:: Send, (     ; [] --> ()
;CapsLock & ]:: Send, )     ;


;;;------------------- ???
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
;;===============左上==================;;
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

;;; ----------------查单词-----------------------
CapsLock & z::
send ^c
sleep 10
url := "https://www.vocabulary.com/dictionary/" . clipboard
if(strlen(url)<100)
{
run chrome.exe %url%
}
return


;;============Capslock改造大法v1.0================;;
;;;===================================================;;
;;;===================================================;;
;;=================================================;;
;;=================================================;;
;;=================================================;;
;;=================================================;;
;;=================================================;;







;;{{{{{{{{{{{{{{{法语输入法}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};;
:*:f/e::{U+E9}
:*:f\e::{U+E8}
:*:f^e::{U+EA}
:*:fsc::{U+E7}
:*:f''i::{U+EF}
:*:f^i::{U+EE}
:*:f^u::{U+FB}
:*:f\u::{U+F9}
:*:f''u::{U+FC}
:*:f^o::{U+F4}
:*:f\a::{U+E0}
:*:f^a::{U+E2}
:*:foe::{U+153}
CapsLock & e:: Send, {U+E9}
CapsLock & a:: Send, {U+E0}



;;*******????????*****************;;
:://qq::
run C:\Program Files (x86)\Tencent\QQ\Bin\QQ.exe
return

:://music::
run C:\Program Files (x86)\Netease\CloudMusic\cloudmusic.exe
return

:://anki::
run C:\Users\zsy\Desktop\Anki.lnk
return

:://dosbox::
run C:\Users\Public\Desktop\DOSBox 0.74.lnk
return

:://enote::
run C:\Users\zsy\Desktop\Evernote.lnk
return

:://vsc::
run C:\Users\Public\Desktop\Visual Studio Code.lnk
return

:://vs::
run C:\Users\zsy\Desktop\VS2015.lnk
return

:://bash::
run C:\Users\Public\Desktop\Git Bash.lnk
return

:://ch::
run C:\Users\Public\Desktop\Google Chrome.lnk
return

:://dw::
run C:\Users\zsy\Desktop\Dreamweaver CS6.lnk
return

:://myroot::
run C:\Users\zsy\Desktop\myroot.lnk
return

:://ahk::
run C:\Users\zsy\Desktop\AutoHotkey.lnk
return

:://bdwp::
run C:\Users\zsy\Desktop\bdwp.lnk
return

:://lt::
run C:\Users\zsy\Desktop\Lantern.lnk
return

;:://dict::
;run C:\Users\zsy\Desktop\dict.lnk
;return

:://frdict::
run http://www.frdic.com/
return

:://blbl::
run https://www.bilibili.com/
return






;====================??????======================;
:*:/mm/::zhang19980918
:*:/reg1/::
:*:/reg2/::


