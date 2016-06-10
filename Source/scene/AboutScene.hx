package scene;


import haxe.ui.toolkit.core.interfaces.IDisplayObjectContainer;
import haxe.ui.toolkit.core.PopupManager;
import haxe.ui.toolkit.controls.CheckBox;
import haxe.ui.toolkit.controls.OptionBox;
import haxe.ui.toolkit.controls.Button;
import haxe.ui.toolkit.events.UIEvent;
import haxe.ui.toolkit.core.Toolkit;

/**
 * Displays information about the project
 * @author 
 */
class AboutScene extends PopupScene {

    public function new() {
        super();

        //Set Preferences
        title = "About";
        width = 500;
        buttons = [PopupButton.OK];

        //Layout
        view = Toolkit.processXmlResource("assets/ui/layout/about.xml");

        
        //If "Reset" button is pressed, delete data.
        view.findChild("reset", Button).onClick = function (e:UIEvent) {
            new Configuration().clear();
        }
        
    }

}