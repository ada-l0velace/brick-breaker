package ;
import flash.Lib;
import openfl.display.Sprite;
import flash.events.Event;
import openfl.events.KeyboardEvent;

enum GameState {
    Paused;
    Playing;
}

class Main extends Sprite {

    static var _instance = null;
    var  _gameObjects:List<GameObject>;
    var paddle:Paddle;
    var keys:Map<Int, Bool> = new Map<Int,Bool>();

    public function new() {
        super();
        _gameObjects = new List<GameObject>();
        paddle = new Paddle(0, 180);
        _gameObjects.add(paddle);
        this.addChild(paddle);

        Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
        Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
        Lib.current.stage.stage.addEventListener(Event.ENTER_FRAME, update);
    }

    public function update(evt:Event):Void {
        for(go in _gameObjects)
            go.update(1);

        if (keys[39])
            paddle.move(new Point(1,0));
        else if (keys[37])
            paddle.move(new Point(-1,0));
        else
            paddle.move(new Point(0,0));
    }

    public function getGameObjects():List<GameObject> {
        return _gameObjects;
    }

    public static function getInstance():Main {
        if (_instance == null)
            _instance = new Main();
        return _instance;
    }

    private function onKeyDown(evt:KeyboardEvent):Void {
        keys[evt.keyCode] = true;
    }

    private function onKeyUp(evt:KeyboardEvent):Void {
        keys[evt.keyCode] = false;
    }

    public static function main() {
        Lib.current.stage.align = flash.display.StageAlign.TOP_LEFT;
        Lib.current.stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
        Lib.current.addChild(new Main());
    }
	
	
}