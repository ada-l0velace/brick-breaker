package;
import flash.Lib;
import openfl.display.Sprite;
import flash.events.Event;
import openfl.events.KeyboardEvent;
import flash.geom.Point;

enum GameState {
    Paused;
    Playing;
}

class Board extends Sprite {
    var _height:Int;
    var _width:Int;
    var _gameObjects:List<GameObject>;
    var _paddle:Paddle;
    var _keys:Map<Int, Bool> = new Map<Int,Bool>();
    var _stage = Lib.current.stage;

    public function new(width:Int, height:Int) {
        super();
        _width = height;
        _height = height;

        _paddle = new Paddle(0, 180);

        _gameObjects = new List<GameObject>();
        _gameObjects.add(_paddle);
        this.addChild(_paddle);

        _stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
        _stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
        _stage.addEventListener(Event.ENTER_FRAME, update);
    }

    public function update(evt:Event):Void {
        for(go in _gameObjects)
            go.update(1);

        if (_keys[39])
            _paddle.move(new Point(1,0));
        else if (_keys[37])
            _paddle.move(new Point(-1,0));
        else
            _paddle.move(new Point(0,0));
    }

    public function getGameObjects():List<GameObject> {
        return _gameObjects;
    }



    private function onKeyDown(evt:KeyboardEvent):Void {
        _keys[evt.keyCode] = true;
    }

    private function onKeyUp(evt:KeyboardEvent):Void {
        _keys[evt.keyCode] = false;
    }

}
