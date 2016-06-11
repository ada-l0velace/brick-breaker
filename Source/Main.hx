package ;

import openfl.Lib;
import openfl.display.Sprite;
import openfl.Assets;
import haxe.ui.toolkit.core.Toolkit;
import haxe.ui.toolkit.core.Macros;

import scene.MainMenu;

import haxe.ui.toolkit.style.StyleManager;
import haxe.ui.toolkit.style.Style;


class Main extends Sprite {

    static var _instance = null;
    @:isVar var _board(get, null):Board;
	var currentScale:Float = 1; // scale factor used by the resize function
	
    public function set__board(value:Board) {
        return this._board = value;
    }

    public static var STAGE_HEIGHT_CENTER:Float;
    public static var STAGE_WIDTH_CENTER:Float;

    public function get__board():Board {
        return _board;
    }

    private function new() {
        super();
		//first resize and listener
		var stage = Lib.current.stage;
        STAGE_HEIGHT_CENTER = stage.stageHeight;
        STAGE_WIDTH_CENTER = stage.stageWidth;

        //_board = new Board(stage.stageWidth, stage.stageHeight);
        //Initialize HaxeUI Library
        Toolkit.theme = new  haxe.ui.toolkit.themes.GradientTheme();
        Toolkit.init();
        Macros.addStyleSheet("Assets/ui/layout/style.css"); //Stylesheet 
		Macros.addStyle("Button", "fontName:'SquareFont'; fontEmbedded:true");
		Macros.addStyle("Text", "fontName:'SquareFont'; fontEmbedded:true");
        //Show Start Menu
        new MainMenu().show();
		
        //new GameScene(0).show();
        //new LevelMenu().show();
        //new GameScene(3).show();
        //this.addChild(_board);
    }

    public static function getInstance():Main {
        if (_instance == null)
            _instance = new Main();
        return _instance;
    }

    public static function main() {
		Lib.current.stage.align = openfl.display.StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = openfl.display.StageScaleMode.NO_SCALE;
        Lib.current.addChild(getInstance());
    }
	
}