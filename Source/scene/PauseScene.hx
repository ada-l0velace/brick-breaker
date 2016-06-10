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

        super();
		var b:Board = Main.getInstance().get__board();
        //Set Preferences
        width = 300;
        title = "Pause game";
        buttons = [];


        //Layout
        view = Toolkit.processXmlResource("assets/ui/layout/pause.xml");

        //Define Events for "Back to game"
        view.findChild("resume", Button, true).onClick = function(e:UIEvent){    resume();    };

        //Set the events for the main menu and reboot
        view.findChild("main-menu", Button, true).onClick = function(e:UIEvent){ b.remove();   new MainMenu().show();     };
        view.findChild("restart", Button, true).onClick = function(e:UIEvent){  b.remove(); new GameScene(0).show();    };


    }



    //Close the pause menu and start again Gameloop
    private function resume() {
        Main.getInstance().get__board().running = true;
        close(); 
    }

}