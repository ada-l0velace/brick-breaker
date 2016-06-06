package scene;

import haxe.ui.toolkit.core.Toolkit;
import haxe.ui.toolkit.events.UIEvent;
import haxe.ui.toolkit.controls.Button;
import haxe.ui.toolkit.containers.Grid;

import Configuration;

/*
    Displays the Level menu in which you select the current level.
*/
class LevelMenu extends FullScreen {


    public function new() {
        super();

        //load and display UI
        view = Toolkit.processXmlResource("assets/ui/layout/level-menu.xml");

        var configuration: Configuration = new Configuration();
        var container: Grid = view.findChild("level-container", Grid, true);

        //Buttons for each level effort
        for (i in 0...configuration.TOTALLEVELS) {
            var button: Button = new Button();
            button.text = i+1 + ".";
            button.autoSize = false;
            button.styleName = "level-button";
            button.disabled = i > configuration.LEVEL;
            button.onClick = function(e:UIEvent){ new GameScene(i).show(); };
            container.addChild(button);
        }


        //onClick-Events
        view.findChild("main-menu", Button, true).onClick = function(e:UIEvent){    new MainMenu().show();    };

    }

}