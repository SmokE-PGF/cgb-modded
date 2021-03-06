;This function checks whether the pixel, located in the eyes of the builder in mainscreen, is available
;If it is not available, it calls checkObstacles and also waitMainScreen.

Func checkMainScreen($Check = True) ;Checks if in main screen
	If $Check = True Then
		SetLog("Trying to locate Main Screen")
		_WinAPI_EmptyWorkingSet(WinGetProcess($Title)) ; Reduce BlueStacks Memory Usage
	EndIf
	$isCheck = false
	While _ColorCheck(_GetPixelColor(284, 28, True), Hex(0x41B1CD, 6), 20) = False
		$HWnD = WinGetHandle($Title)

		If _Sleep(1000) Then Return
		If checkObstacles() = False Then
			Click(126, 700, 1, 500)
			Local $RunApp = StringReplace(_WinAPI_GetProcessFileName(WinGetProcess($Title)), "Frontend", "RunApp")
			Run($RunApp & " Android com.supercell.clashofclans com.supercell.clashofclans.GameApp")
		else
			$isCheck = true
		EndIf
		waitMainScreen()
	WEnd
	ZoomOut()
	If $Check = True Then SetLog("Main Screen Located", $COLOR_GREEN)
	if $isCheck then
		runBot()
		return
	endif
EndFunc   ;==>checkMainScreen
