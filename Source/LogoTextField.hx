package;

import openfl.Lib;
import openfl.Assets;
import openfl.display.Stage;
import openfl.display.Sprite;
import openfl.text.Font;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFieldAutoSize;
import haxe.ui.toolkit.containers.SpriteContainer;
import openfl.display.Sprite;
import openfl.text.Font;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
/**
 * ...
 * @author 
 */


class LogoTextField{
	
	var w:Float; //height (5%) (bar height)
    var h:Float; //width (90%) (bar width)
    var r:Float; //radius (borders)
    var p:Float; //padding pixels
    var t:Float; //thickness (borders)
	var a:Sprite;
	
	public function new(name:String, xC:Float , yC:Float) {
		h = 0.05 * Lib.current.stage.stageHeight;      //height (5%) (bar height)
        w = 0.9 * Lib.current.stage.stageWidth;       //width (90%) (bar width)
        p = Lib.current.stage.stageHeight/100;         //padding pixels
        r = Lib.current.stage.stageHeight/50;          //radius (borders)
        t = Lib.current.stage.stageHeight/250;         //thickness (borders)
        //var x = (Lib.current.stage.stageWidth-w)/2;   //centered (center bar position x,y)
        //var y = Lib.current.stage.stageHeight*0.3;
		var x = xC;
		var y = yC;
		var textLoading:TextField;
		textLoading = new TextField();
        textLoading.embedFonts = true;
        textLoading.selectable = false;
        textLoading.text = name;
		a = new Sprite(); a.addChild(textLoading);
		var formatLoading = new TextFormat (Assets.getFont ("assets/preloader/Square.ttf").fontName, Std.int(Lib.current.stage.stageHeight/10.0), 0xff9600);
        textLoading.defaultTextFormat = formatLoading; //dynamic text (HTML5)
        textLoading.setTextFormat(formatLoading); //static text
        textLoading.autoSize = TextFieldAutoSize.CENTER;
        textLoading.x = Lib.current.stage.stageWidth/2-textLoading.textWidth/2;
        textLoading.y = y - textLoading.textHeight - 0.5 * h;
	}
	
	public function result():SpriteContainer {
		return new SpriteContainer(a);
	}
	
}