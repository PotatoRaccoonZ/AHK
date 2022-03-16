#CommentFlag //

// Pressionar F11 para dar reload ou parar o script
F11::
MsgBox, Finished Bombcrypto Script.`nCreated by: RaccoonZ`
Reload
Return

// Pressionar Ctrl+J para começar o script
^j::

// Libraries
CoordMode, Mouse, Screen

// Variável totalsleeptime indica o tempo de espera até repetir o processo
// nº minutos * 60 segundos * 1000 milisegundos

totalsleeptime := 60 * 60 * 1000
inactiveclicks := 10
sleeptime := totalsleeptime / inactiveclicks

total_windows := 0
window_counter := 0

MsgBox, Pressionar F11 para parar o script.


if ErrorLevel
    MsgBox, CANCEL was pressed.
else
{
	// Posiciona Janelas no seu lugar
	WinGet, id, List, Bombcrypto
	Loop, %id%
	{
		this_id := id%A_Index%
		WinMove ahk_id %this_id%,, WindowPos("x", window_counter), WindowPos("y", window_counter), 974, 810
		//WinActivate, ahk_id %this_id%
		window_counter++
		total_windows++
	}
	window_counter := 0
	
	Loop 
	{
		Loop, %total_windows%
		{			
			// Focus nas Janelas
			Loop, %id%
			{
				this_id := id%A_Index%
				WinActivate, ahk_id %this_id%
			}
			
			Loop, 2
			{
				// Abre Menu dos Heroes
				xPos := HeroesButtonPos("x", window_counter)
				yPos := HeroesButtonPos("y", window_counter)
				Click, %xPos%, %yPos%	
				Sleep, 1000
			}
			
			// Tudo a Workar
			xPos := WorkButtonPos("x", window_counter)
			yPos := WorkButtonPos("y", window_counter)
			Click, %xPos%, %yPos%	
			Sleep, 1000
			
			// Fechar Janela dos Heroes
			xPos := CloseButtonPos("x", window_counter)
			yPos := CloseButtonPos("y", window_counter)
			Click, %xPos%, %yPos%	
			Sleep, 500
			
			// Clica no ecrã de jogo
			xPos := TreasureHuntButtonPos("x", window_counter)
			yPos := TreasureHuntButtonPos("y", window_counter)
			Click, %xPos%, %yPos%	
			
			window_counter++
		}
		window_counter := 0
		
		// Evitar ser disconectado por inatividade
		Loop %inactiveclicks%
		{		
			// Focus nas Janelas
			Loop, %id%
			{
				this_id := id%A_Index%
				WinActivate, ahk_id %this_id%
			}
			
			Loop %total_windows%
			{
				// Reconnect em caso de desconexão
				reconnectPlayer("account", window_counter)
				
				// Volta para o menu principal
				xPos := BackButtonPos("x", window_counter)
				yPos := BackButtonPos("y", window_counter)
				Click, %xPos%, %yPos%
				
				// Clica para jogar Treasure Hunt
				xPos := TreasureHuntButtonPos("x", window_counter)
				yPos := TreasureHuntButtonPos("y", window_counter)
				Click, %xPos%, %yPos%
				
				window_counter++
			}
			window_counter := 0
			
			// Delay para repetir o mambo
			Sleep, %sleeptime%
		}
	}  
}
Return


// Return Window Position to Given Direction
WindowPos(direction, count)
{
	if(direction = "x"){
		if(count = 0)
			return -7
		if(count = 1)
			return 953
	}
	if(direction = "y"){
		if(count = 0 or count = 1)
			return 0
	}
}

// Return Heroes Button Position to Given Direction
HeroesButtonPos(direction, count)
{
	if(direction = "x"){
		if(count = 0)
			return 500
		if(count = 1)
			return 1460
	}
	if(direction = "y"){
		if(count = 0 or count = 1)
			return 720
	}
}

// Return Work Button Position to Given Direction
WorkButtonPos(direction, count)
{
	if(direction = "x"){
		if(count = 0)
			return 420
		if(count = 1)
			return 1380
	}
	if(direction = "y"){
		if(count = 0 or count = 1)
			return 315
	}
}

// Return Close Button Position to Given Direction
CloseButtonPos(direction, count)
{
	if(direction = "x"){
		if(count = 0)
			return 560
		if(count = 1)
			return 1520
	}
	if(direction = "y"){
		if(count = 0 or count = 1)
			return 260
	}
}

// Return Treasure Hunt Button Position to Given Direction
TreasureHuntButtonPos(direction, count)
{
	if(direction = "x"){
		if(count = 0)
			return 500
		if(count = 1)
			return 1460
	}
	if(direction = "y"){
		if(count = 0 or count = 1)
			return 500
	}
}

// Return Back Button Position to Given Direction
BackButtonPos(direction, count)
{
	if(direction = "x"){
		if(count = 0)
			return 70
		if(count = 1)
			return 1020
	}
	if(direction = "y"){
		if(count = 0 or count = 1)
			return 180
	}
}

// Reconnect em caso de disconnect xD
reconnectPlayer(loginType, count)
{
	if(loginType = "account"){
		// Clica para logar com conta criada
		xPos := connectButtonPos("x", count)
		yPos := connectButtonPos("y", count)
		Click, %xPos%, %yPos%
		
		Sleep, 1000
		
		// Clica login button
		xPos := loginButtonPos("x", loginType, count)
		yPos := loginButtonPos("y", loginType, count)
		Click, %xPos%, %yPos%
		
		Sleep, 10000
	}
}

connectButtonPos(direction, count){
	if(direction = "x") {
		if(count = 0) {
			return 490
		}
		if(count = 1) {
			return 1450
		}
	}
	if(direction = "y") {
		if(count = 0 or count = 1) {
			return 640
		}
	}
}

loginButtonPos(direction, loginType, count){
	if(loginType = "account") {
		if(direction = "x") {
			if(count = 0) {
				return 485
			}
			if(count = 1) {
				return 1450
			}
		}
		if(direction = "y") {
			if(count = 0 or count = 1) {
				return 480
			}
		}
	}
}