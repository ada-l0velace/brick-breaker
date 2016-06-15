package;

import openfl.Lib;
import openfl.display.Stage;
import openfl.display.Sprite;
import openfl.text.Font;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFieldAutoSize;
import haxe.ui.toolkit.containers.SpriteContainer;
import openfl.events.Event;
/**
 * ...
 * @author 
 */



class LogoTextField {

    static var color = 0xff9600; //the main color
	var splash:Sprite;
    var stringLoading:String;
    var ww:Float; //current window width
    var hh:Float; //current window height
    var w:Float; //height (5%) (bar height)
    var h:Float; //width (90%) (bar width)

    var textLoading:TextField; // loading label

    public function init() {
        textLoading = new TextField();
        textLoading.embedFonts = true;
        textLoading.selectable = false;
        textLoading.text = stringLoading;

    }

	public function new(name:String) {
        stringLoading = name;
        init();
        stage_onResize(null);
        Lib.current.stage.addEventListener(Event.RESIZE, stage_onResize);
        textLoading.addEventListener(Event.COMPLETE, onComplete);
        //addChild(textLoading);
	}

    private function stage_onResize (event:Event):Void {
        resize (Lib.current.stage.stageWidth, Lib.current.stage.stageHeight);
    }

    private function resize (newWidth:Int, newHeight:Int):Void {

        ww = newWidth;
        hh = newHeight;
        w = 0.9 * ww;       //width (90%) (bar width)
        var x = (ww-w)/2;   //centered (center bar position x,y)
        var y = hh*0.2;

        var formatLoading = new TextFormat ("SquareFont", Std.int(hh/10.0), color);
        textLoading.defaultTextFormat = formatLoading; //dynamic text (HTML5)
        textLoading.setTextFormat(formatLoading); //static text
        textLoading.autoSize = TextFieldAutoSize.CENTER;
        textLoading.x = ww/2-textLoading.textWidth/2;
        textLoading.y = y-textLoading.textHeight-0.5*h;

    }

    public function onComplete (event:Event):Void {
        Lib.current.stage.removeEventListener(Event.RESIZE, stage_onResize);
    }
	
	public function result():SpriteContainer {
		return new SpriteContainer(splash);
	}
	
}