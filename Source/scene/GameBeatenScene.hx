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
        
        //Layout
        view = Toolkit.processXmlResource("assets/ui/layout/game-beaten.xml");


        //onClick-Events
        view.findChild("main-menu", Button, true).onClick = function(e:UIEvent){    new MainMenu().show();    };
    }
	
}