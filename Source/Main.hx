package ;
import flash.Lib;
import openfl.display.Sprite;
import flash.events.Event;
import openfl.events.KeyboardEvent;
import flash.geom.Point;

class Main extends Sprite {

    static var _instance = null;
    var _board:Board;

    private function new() {
        super();
        var stage = Lib.current.stage;
        _board = new Board(stage.stageWidth, stage.stageHeight);
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