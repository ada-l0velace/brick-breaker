package ;
import flash.Lib;
import openfl.display.Sprite;
import debug.FpsMem;

class Main extends Sprite {

    static var _instance = null;
    @:isVar var _board(get, null):Board;

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

        _board = new Board(stage.stageWidth, stage.stageHeight);
        //var fps_mem:FpsMem = new FpsMem(60, 260, 0xfffff);

        //addChild(fps_mem);
        this.addChild(_board);
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