package scene;

import openfl.Lib;
import haxe.ui.toolkit.core.Toolkit;
import haxe.ui.toolkit.events.UIEvent;
import haxe.ui.toolkit.controls.Button;
import haxe.ui.toolkit.containers.Grid;
import haxe.ui.toolkit.style.StyleManager;
import haxe.ui.toolkit.style.Style;
import Configuration;
import haxe.ui.toolkit.containers.Container;
import haxe.ui.toolkit.containers.VBox;
import haxe.ui.toolkit.controls.Text;

/**
*  Displays the Level menu in which you select the current level.
**/
class LevelMenu extends FullScreen {


    public function new() {
        super();
        var gs:GameSound = new GameSound();
        //load and display UI
        view = Toolkit.processXmlResource("assets/ui/layout/level-menu.xml");

        var configuration: Configuration = new Configuration();
        var container: Grid = view.findChild("level-container", Grid, true);

        view.addEventListener(UIEvent.RESIZE, function(e:UIEvent) {
            view.findChild("title", Text, true).style.fontSize=view.findChild("level-box", VBox, true).width*0.147;
        });
        //Buttons for each level effort
        for (i in 0...configuration.TOTALLEVELS) {
            var button: Button = new Button();
            button.text = i+1 + ".";
            button.autoSize = false;
            
            
            button.styleName = "level-button";
            button.disabled = i > configuration.LEVEL;
            button.onClick = function(e:UIEvent){ gs.buttonClickSound(); new GameScene(i).show(); };
            button.onMouseOver = function(e:UIEvent){ gs.buttonOverSound(); };
            container.addChild(button);
        }



        //onClick-Events
        view.findChild("main-menu", Button, true).onClick = function(e:UIEvent){  gs.buttonClickSound();  new MainMenu().show();    };
        view.findChild("main-menu", Button, true).onMouseOver = function(e:UIEvent){     gs.buttonOverSound();    };

    }

}