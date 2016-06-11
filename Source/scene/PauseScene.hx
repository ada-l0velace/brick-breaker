package scene;

import haxe.ui.toolkit.core.Toolkit;
import haxe.ui.toolkit.controls.Text;
import haxe.ui.toolkit.controls.Button;
import haxe.ui.toolkit.events.UIEvent;
import openfl.events.KeyboardEvent;
import openfl.ui.Keyboard;
import openfl.Lib;

//import app.entities.Level;
//import app.math.Time;

/**
    Pause menu appears when the player presses the escape key.
*/
class PauseScene extends PopupScene {

    public function new() {
		var gs:GameSound = new GameSound();
        super();
		var b:Board = Main.getInstance().get__board();
		
        //Set Preferences
        width = 300;
        title = "Pause game";
        buttons = [];
		//Layout
        view = Toolkit.processXmlResource("assets/ui/layout/pause.xml");
		var resumeButton:Button = view.findChild("resume", Button, true);
		var mainMenu:Button = view.findChild("main-menu", Button, true);
		var restart:Button = view.findChild("restart", Button, true);

        

        //Define Events for "Back to game"
        resumeButton.onClick = function(e:UIEvent) { gs.buttonClickSound(); resume(); };
        //Set the events for the main menu and reboot
        mainMenu.onClick = function(e:UIEvent) { gs.buttonClickSound(); b.remove(); new MainMenu().show(); };
        restart.onClick = function(e:UIEvent) {  gs.buttonClickSound(); b.remove(); new GameScene(0).show(); };

		 //Define Events for "Back to game"
        resumeButton.onMouseOver = function(e:UIEvent){    gs.buttonOverSound();  };
        //Set the events for the main menu a nd reboot
        mainMenu.onMouseOver = function(e:UIEvent) { gs.buttonOverSound();  };
        restart.onMouseOver = function(e:UIEvent) {  gs.buttonOverSound();  };
    }



    //Close the pause menu and start again Gameloop
    private function resume() {
        Main.getInstance().get__board().running = true;
        close(); 
    }

}