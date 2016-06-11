package scene;


import haxe.ui.toolkit.events.UIEvent;
import haxe.ui.toolkit.controls.Button;
import haxe.ui.toolkit.core.Toolkit;
import flash.events.Event;
import openfl.Assets;
import openfl.media.Sound;

import openfl.Lib;
import openfl.display.Stage;
import openfl.display.Sprite;
import openfl.text.Font;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFieldAutoSize;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.net.URLRequest;
import haxe.ui.toolkit.containers.Container;
import openfl.system.System;
/**
* Main Menu
**/
class MainMenu extends FullScreen  {
    
    public function new() {
        super();
        //Layout
		var gs:GameSound = new GameSound();
        view = Toolkit.processXmlResource("assets/ui/layout/main-menu.xml");

        //onClick-Events
		var start:Button = view.findChild("start", Button, true);
		var options:Button = view.findChild("options", Button, true);
		var about:Button = view.findChild("about", Button, true);
		var quit:Button = view.findChild("quit", Button, true);
		
		quit.visible = false;
		
        start.onClick = function(e:UIEvent){ gs.buttonClickSound(); new LevelMenu().show(); };
        options.onClick = function(e:UIEvent){ gs.buttonClickSound();  new OptionsScene().show();  };
        about.onClick = function(e:UIEvent){  gs.buttonClickSound();   new AboutScene().show();    };
        /*quit.onClick = function(e:UIEvent){ gs.buttonClickSound();  System.exit(0); };*/
		
		start.onMouseOver = function(e:UIEvent){ gs.buttonOverSound(); };
        options.onMouseOver = function(e:UIEvent){ gs.buttonOverSound();  };
        about.onMouseOver = function(e:UIEvent){ gs.buttonOverSound();   /*new AboutScene().show();*/    };
        /*quit.onMouseOver = function(e:UIEvent){ gs.buttonOverSound(); };*/
		
		new LogoTextField("Brick Breaker", (Lib.current.stage.stageWidth - 0.9 * Lib.current.stage.stageWidth) / 2,  Lib.current.stage.stageHeight * 0.3);
		//view.addChild(new LogoTextField("Brick Breaker", (Lib.current.stage.stageWidth-0.9 * Lib.current.stage.stageWidth)/2,  Lib.current.stage.stageHeight*0.3).result());
		
		
    }

}