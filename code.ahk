setTimer("initCheck",45000)
initCheck()

initCheck(){
    if (!checkConnection(1500)){
        if (!checkConnection(3000)){
            if (!checkConnection(4500)){
                restartDial()
            }
        }
    }
}

restartDial(){
    while (processExist("ESurfingClient.exe") | processExist("SelfDebugTool.exe")){
        try{
            processClose("ESurfingClient.exe")
            processClose("SelfDebugTool.exe")
        }
    }
    run "C:\Program Files (x86)\Chinatelecom_JSPortal\ESurfingClient.exe"
    sleep(12000)
    try winClose("ahk_id" winGetID("Windows 安全中心警告 ahk_exe ESurfingClient.exe"))
    sleep(800)
    WinGetPos(, , Width, Height, "ahk_exe ESurfingClient.exe")
    X := Width*0.5
    Y := Height * 0.55
    controlClick("x" X " y" Y, "ahk_exe ESurfingClient.exe")
    sleep(8000)
    try winClose("ahk_id" winGetID("Windows 安全中心警告 ahk_exe ESurfingClient.exe"))
    if (!checkConnection(3000)){
        controlClick("x" X " y" Y, "ahk_exe ESurfingClient.exe")
    }
}

checkConnection(timeOut){
    statusCode := 0
    Captive := ComObjCreate("WinHttp.Winhttprequest.5.1")
    Captive.open("GET","https://connect.rom.miui.com/generate_204")
    Captive.setTimeouts(timeOut,timeOut,timeOut,timeOut)
    try {
        Captive.send()
        statusCode := Captive.Status
    }
    if(statusCode = 204){
        return 1
    }
    else{
        return 0
    }
}
