package scene;

import openfl.Lib;
import haxe.ui.toolkit.events.UIEvent;
import haxe.ui.toolkit.controls.Button;
import haxe.ui.toolkit.controls.Text;
import haxe.ui.toolkit.core.Toolkit;
import haxe.ui.toolkit.containers.Container;
import haxe.ui.toolkit.containers.VBox;
import haxe.ui.toolkit.style.StyleManager;

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
        view.addEventListener(UIEvent.RESIZE, function(e:UIEvent) {
            view.findChild("title", Text, true).style.fontSize=view.findChild("menu-box", VBox, true).width*0.147;
        });

		
    }

}