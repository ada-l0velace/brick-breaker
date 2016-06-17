package scene;


import openfl.Lib;
import openfl.display.StageDisplayState;

import haxe.ui.toolkit.core.interfaces.IDisplayObjectContainer;
import haxe.ui.toolkit.core.PopupManager;
import haxe.ui.toolkit.controls.CheckBox;
import haxe.ui.toolkit.controls.OptionBox;
import haxe.ui.toolkit.controls.HSlider;
import haxe.ui.toolkit.core.Toolkit;

/**
*    Options window , in which the player can select settings .
**/
class OptionsScene extends PopupScene {

    private var configuration: Configuration;

    public function new() {
        super();

        //Set preferences
        title = "Settings";
        width = 500;
        buttons = [PopupButton.OK, PopupButton.CANCEL];
        configuration = new Configuration();

        var gs:GameSound = new GameSound();
        //Load layout and set values
        view = loadOptions(Toolkit.processXmlResource("assets/ui/layout/options.xml"));

        //define the actions , if the OK button has been pressed
        callback = function(btn:Dynamic) {
            if (btn == PopupButton.OK) {
                gs.buttonClickSound();
                saveOptions(view); //Save configuration
            }
            else if (btn == PopupButton.CANCEL)
                gs.buttonOverSound();
        };


    }


    //Read settings from the configuration file and show the options menu
    private function loadOptions(view: IDisplayObjectContainer) : IDisplayObjectContainer {
        
        view.findChild("debug", CheckBox, true).selected = configuration.DEBUG;
        view.findChild("volume", OptionBox, true).selected = configuration.VOLUME;

        return view;
    }

    //Read Settings from the options menu and write to the configuration file
    private function saveOptions(view: IDisplayObjectContainer) : Void {

        configuration.DEBUG = view.findChild("debug", CheckBox, true).selected;
        configuration.VOLUME = view.findChild("volume", OptionBox, true).selected;

        configuration.save();



    }

}