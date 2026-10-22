#Requires AutoHotkey v2.0
#SingleInstance Force
CoordMode "Mouse", "Screen"

; ===== 設定 =====
MIN_DRAG  := 10     ; 右鍵移動超過幾像素才算拖曳
DOUBLE_MS := 300    ; 兩次右鍵間隔在幾毫秒內算「連按兩下」
; ================

^!q:: ExitApp       ; Ctrl+Alt+Q 結束腳本

*RButton:: {
    MouseGetPos &x0, &y0
    dragging := false

    ; 按住期間判斷有沒有拖曳
    while GetKeyState("RButton", "P") {
        MouseGetPos &x, &y
        if Sqrt((x - x0) ** 2 + (y - y0) ** 2) >= MIN_DRAG {
            dragging := true
            break
        }
        Sleep 10
    }

    if dragging {
        DragCopyPaste()
        return
    }

    ; 沒拖曳 → 看看有沒有第二下
    if KeyWait("RButton", "D T" DOUBLE_MS / 1000) {
        KeyWait "RButton"
        Send "^c"
        ShowTip "已複製"
    } else {
        ; 只按一下 → 一般右鍵，選單照常出現
        SendInput "{Blind}{RButton down}{RButton up}"
    }
}

; 右鍵拖曳：複製選取文字，拖到放開的位置貼上
DragCopyPaste() {
    saved := ClipboardAll()
    A_Clipboard := ""
    Send "^c"
    gotText := ClipWait(0.5)    ; 只接受文字

    KeyWait "RButton"           ; 等拖到目的地放開

    if gotText {
        Click                   ; 在放開的位置點一下，把游標移過去
        Sleep 50
        Send "^v"
        Sleep 200
        ShowTip "已貼上"
    }

    A_Clipboard := saved        ; 拖曳貼上不影響原本的剪貼簿
}

ShowTip(text) {
    ToolTip text
    SetTimer () => ToolTip(), -600
}
