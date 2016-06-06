package scene;

import haxe.ui.toolkit.events.UIEvent;
import haxe.ui.toolkit.controls.Button;
import haxe.ui.toolkit.core.Toolkit;


/**
* Main Menu
**/
class MainMenu extends FullScreen  {

    public function new() {
        super();
        //Layout
        view = Toolkit.processXmlResource("assets/ui/layout/main-menu.xml");
        //trace("WTF");
        //onClick-Events

        view.findChild("start", Button, true).onClick = function(e:UIEvent){ new LevelMenu().show();};
        view.findChild("options", Button, true).onClick = function(e:UIEvent){  /*new OptionsScene().show();*/  };
        view.findChild("about", Button, true).onClick = function(e:UIEvent){    /*new AboutScene().show();*/    };
        view.findChild("quit", Button, true).onClick = function(e:UIEvent){ trace("exit"); };
        //trace("WTF");
    }

}