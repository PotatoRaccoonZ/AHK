#CommentFlag //

// Considerar inatividade
// Considerar alteração de mapa

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
totalsleeptime := 70 * 60 * 1000
sleeptime := totalsleeptime / 10
inactiveclicks := 10

MsgBox, Pressionar F11 para parar o script.

if ErrorLevel
    MsgBox, CANCEL was pressed.
else
{
	// Posiciona Janela no Canto Superior Esquerdo
	WinWait, Bombcrypto
	WinMove, Bombcrypto, , -7, 0, 974, 810
	Loop 
	{
		// Focus na Janela
		WinActivate, Bombcrypto
		
		Loop 2
		{
			// Abre Menu dos Heroes
			Click, 500, 720
			Sleep, 1000
		}
		
		// Tudo a Workar
		Click, 420, 315
		Sleep, 1000
		
		// Fechar Janela dos Heroes
		Click, 560, 260
		Sleep, 500
		
		// Clica no ecrã de jogo
		Click, 500, 500
		
		// Evitar ser disconectado por inatividade
		Loop %inactiveclicks%
		{
			// Focus na Janela
			WinActivate, Bombcrypto
			
			// Volta para o menu principal
			Click, 70, 180
			
			// Clica para jogar Treasure Hunt
			Click, 500, 500
			
			// Delay para repetir o mambo
			Sleep, %sleeptime%
		}
	}  
}
Return