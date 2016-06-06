package ;
import scene.LevelMenu;
import scene.Scene;
import scene.GameScene;
import flash.Lib;
import openfl.display.Sprite;
import debug.FpsMem;

import haxe.ui.toolkit.core.Toolkit;
import haxe.ui.toolkit.core.Macros;

import scene.MainMenu;

class Main extends Sprite {

    static var _instance = null;
    @:isVar var _board(get, null):Board;

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
        var stage = Lib.current.stage;

        STAGE_HEIGHT_CENTER = stage.stageHeight;
        STAGE_WIDTH_CENTER = stage.stageWidth;

        //_board = new Board(stage.stageWidth, stage.stageHeight);
        //Initialize HaxeUI Library
        Toolkit.theme = new  haxe.ui.toolkit.themes.GradientTheme();
        Toolkit.init();
        Macros.addStyleSheet("Assets/ui/layout/style.css"); //Stylesheet laden

        //If you have chosen the "full screen" option window must be brought into full screen mode
        //Lib.current.stage.displayState = new Configuration().FULLSCREEN ? StageDisplayState.FULL_SCREEN_INTERACTIVE
        //: StageDisplayState.NORMAL;


        //Show Start Menu
        new MainMenu().show();
        //new GameScene(0).show();
        //new LevelMenu().show();
        //new GameScene(3).show();
        //var fps_mem:FpsMem = new FpsMem(60, 260, 0xfffff);

        //addChild(fps_mem);
        //this.addChild(_board);
    }

    public static function getInstance():Main {
        if (_instance == null)
            _instance = new Main();
        return _instance;
    }

    public static function main() {
        Lib.current.stage.align = flash.display.StageAlign.TOP_LEFT;
        Lib.current.stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
        Lib.current.addChild(getInstance());
    }
	
	
}