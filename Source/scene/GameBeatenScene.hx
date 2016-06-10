package scene;


import openfl.Lib;

import haxe.ui.toolkit.events.UIEvent;
import haxe.ui.toolkit.controls.Button;
import haxe.ui.toolkit.core.Toolkit;


/**
 * Displays the player a trophy when he has passed all levels.
 * @author 
 */
class GameBeatenScene extends FullScreen {

	public function new() {
        super();
        var gs:GameSound = new GameSound();
        //Layout
        view = Toolkit.processXmlResource("assets/ui/layout/game-beaten.xml");


        //onClick-Events
		var mainMenu:Button = view.findChild("main-menu", Button, true);
        mainMenu.onClick = function(e:UIEvent){ gs.buttonClickSound(); new MainMenu().show(); };
    
		mainMenu.onMouseOver = function(e:UIEvent){ gs.buttonOverSound(); };
	}
	
}