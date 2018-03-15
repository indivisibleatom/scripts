#include-Once

Global $__MonitorList[1][5]
$__MonitorList[0][0] = 0

HotKeySet("^+{UP}", "ResizeWindowToTwo") ; CTRL+SHIFT+UP
While 1
    Sleep(1000)
WEnd
Func ResizeWindowToTwo()
    WinSetState("[ACTIVE]","",@SW_RESTORE)
    _GetMonitors()
    If $__MonitorList[0][0] > 1 Then
        Local $horizRes = $__MonitorList[2][3]-$__MonitorList[1][1]
        Local $vertRes = $__MonitorList[1][4]-$__MonitorList[1][2]
        WinMove("[ACTIVE]","",0,0,$horizRes,$vertRes)
    EndIf
EndFunc


; Helpers

; Get resolution details for monitors
; Credit: https://www.autoitscript.com/forum/topic/82353-dual-monitor-resolution-detection/

;==================================================================================================
; Function Name:   _GetMonitors()
; Description::    Load monitor positions
; Parameter(s):    n/a
; Return Value(s): 2D Array of Monitors
;                       [0][0] = Number of Monitors
;                       [i][0] = HMONITOR handle of this monitor.
;                       [i][1] = Left Position of Monitor
;                       [i][2] = Top Position of Monitor
;                       [i][3] = Right Position of Monitor
;                       [i][4] = Bottom Position of Monitor
; Note:            [0][1..4] are set to Left,Top,Right,Bottom of entire screen
;                  hMonitor is returned in [i][0], but no longer used by these routines.
;                  Also sets $__MonitorList global variable (for other subs to use)
; Author(s):       xrxca (autoit@forums.xrx.ca)
;==================================================================================================
Func _GetMonitors()
    $__MonitorList[0][0] = 0  ;  Added so that the global array is reset if this is called multiple times
    Local $handle = DllCallbackRegister("_MonitorEnumProc", "int", "hwnd;hwnd;ptr;lparam")
    DllCall("user32.dll", "int", "EnumDisplayMonitors", "hwnd", 0, "ptr", 0, "ptr", DllCallbackGetPtr($handle), "lparam", 0)
    DllCallbackFree($handle)
    Local $i = 0
    For $i = 1 To $__MonitorList[0][0]
        If $__MonitorList[$i][1] < $__MonitorList[0][1] Then $__MonitorList[0][1] = $__MonitorList[$i][1]
        If $__MonitorList[$i][2] < $__MonitorList[0][2] Then $__MonitorList[0][2] = $__MonitorList[$i][2]
        If $__MonitorList[$i][3] > $__MonitorList[0][3] Then $__MonitorList[0][3] = $__MonitorList[$i][3]
        If $__MonitorList[$i][4] > $__MonitorList[0][4] Then $__MonitorList[0][4] = $__MonitorList[$i][4]
    Next
    Return $__MonitorList
EndFunc   ;==>_GetMonitors

;==================================================================================================
; Function Name:   _MonitorEnumProc($hMonitor, $hDC, $lRect, $lParam)
; Description::    Enum Callback Function for EnumDisplayMonitors in _GetMonitors
; Author(s):       xrxca (autoit@forums.xrx.ca)
;==================================================================================================
Func _MonitorEnumProc($hMonitor, $hDC, $lRect, $lParam)
    Local $Rect = DllStructCreate("int left;int top;int right;int bottom", $lRect)
    $__MonitorList[0][0] += 1
    ReDim $__MonitorList[$__MonitorList[0][0] + 1][5]
    $__MonitorList[$__MonitorList[0][0]][0] = $hMonitor
    $__MonitorList[$__MonitorList[0][0]][1] = DllStructGetData($Rect, "left")
    $__MonitorList[$__MonitorList[0][0]][2] = DllStructGetData($Rect, "top")
    $__MonitorList[$__MonitorList[0][0]][3] = DllStructGetData($Rect, "right")
    $__MonitorList[$__MonitorList[0][0]][4] = DllStructGetData($Rect, "bottom")
    Return 1 ; Return 1 to continue enumeration
EndFunc   ;==>_MonitorEnumProc
