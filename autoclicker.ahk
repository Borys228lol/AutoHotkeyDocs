; AutoHotkey автоклікер — F8 вкл/вимк, F9 змінити інтервал
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

interval := 100 ; інтервал в мс (за замовчуванням 100 мс)
toggle := false

F8::
    toggle := !toggle
    if (toggle) {
        ToolTip, Автоклікер: ВКЛ (інтервал %interval% ms). Натисніть F8 щоб вимкнути.
        SetTimer, Clicker, % -interval ; негайний старт
    } else {
        SetTimer, Clicker, Off
        ToolTip
    }
return

F9::
    InputBox, user, Новий інтервал, Введіть інтервал в мілісекундах (наприклад 100), , 200, 120
    if (ErrorLevel = 0) {
        new := user + 0
        if (new >= 1) {
            interval := new
            ToolTip, Інтервал змінено на %interval% ms
            Sleep, 1200
            ToolTip
        } else {
            ToolTip, Некоректне значення
            Sleep, 1200
            ToolTip
        }
    }
return

Clicker:
    Click
return

Esc::ExitApp
