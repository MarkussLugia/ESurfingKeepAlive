setTimer("initCheck",45000)
Thread "NoTimers", 1
initCheck()

initCheck(){
    if (!checkConnection(1500)){
        if (!checkConnection(3000)){
            if (!checkConnection(4500)){
                restartAndDial()
            }
        }
    }
}

restartAndDial(){
    try processClose("ESurfingClient.exe")
    try processClose("SelfDebugTool.exe")
    run "C:\Program Files (x86)\Chinatelecom_JSPortal\ESurfingClient.exe"
    sleep(8000)
    clickDialButton()
    c := 0
    sleep(4000)
    while ((!checkConnection(2000)) & (c<18)){
        clickDialButton()
        sleep(6000)
        c := c + 1
    }
}

clickDialButton(){
    try{
        winClose("ahk_id" winGetID("Windows 安全中心警告 ahk_exe ESurfingClient.exe"))
        sleep(1000)
    }
    try{
        WinGetPos(, , Width, Height, "ahk_exe ESurfingClient.exe")
        X := Width/2
        Y := Height/1.8
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
    if (statusCode = 204){
        return 1
    }
    else{
        return 0
    }
}
