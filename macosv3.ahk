#NoEnv
#SingleInstance force
SendMode Input
SetWorkingDir %A_ScriptDir%

; 标志变量
g_LWinPressed := false
g_LWinTimeout := ""

; 按下左Win键时启动计时器
LWin::
    g_LWinPressed := true
    SetTimer, CheckLWinRelease, 300  ; 300毫秒后检查是否释放
    return

; 释放左Win键时取消计时器
LWin Up::
    g_LWinPressed := false
    SetTimer, CheckLWinRelease, Off
    return

; 检查LWin键是否应该触发原本的功能
CheckLWinRelease:
    if (g_LWinPressed) {
        ; 如果LWin键仍然被按下超过指定时间，发送LWin键
        Send, {LWin}
        g_LWinPressed := false
    }
    return

; 定义各种快捷键组合，这些会取消LWin的原始功能
LWin & c::SendInput, ^c

LWin & v::SendInput, ^v

LWin & z::SendInput, ^z

LWin & x::SendInput, ^x

LWin & s::SendInput, ^s

LWin & f::SendInput, ^f

LWin & w::SendInput, ^w

LWin & r::SendInput, ^r

LWin & Enter::SendInput, ^{Enter}

LWin & a::SendInput, ^a

LWin & d::SendInput, ^d

LWin & t::SendInput, ^t

LWin & /::SendInput, ^/

LWin & BS::SendInput, {Delete}

LWin & LButton::SendInput, ^{LButton}
