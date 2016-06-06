package;
import Main;
import flash.Lib;
import openfl.display.Sprite;
import flash.events.Event;
import openfl.events.KeyboardEvent;
import flash.geom.Point;


class Board extends Sprite {

    @:isVar var _ball(get, null):Ball;

    public function get__ball():Ball {
        return _ball;
    }
    var _height:Int;
    var _width:Int;
    var _gameObjects:List<GameObject>;
    var _paddle:Paddle;
    public var _topWall:Wall;
    public var _bottomWall:Wall;
    public var _rightWall:Wall;
    public var _leftWall:Wall;

    var _keys:Map<Int, Bool> = new Map<Int,Bool>();
    var _stage = Lib.current.stage;

    public function new(width:Int, height:Int) {
        super();
        _stage.x = 0;
        _stage.y = 0;
        _paddle = new Paddle(Main.STAGE_WIDTH_CENTER*0.5*0.5, 283);
        trace(Main.STAGE_HEIGHT_CENTER*0.5*0.5);
        _gameObjects = new List<GameObject>();
        _gameObjects.add(_paddle);
        _ball = new Ball(20, 120, 0x0);
        _stage.addChild(_ball);

        _topWall = new Wall(0,0,0x0000FF,1210, 10);
        _bottomWall = new Wall(0, 300,0x0000FF, 1210, 10);

        _rightWall = new Wall(600,0,0x0000FF, 10, 600);
        _leftWall = new Wall(0,0,0x0000FF, 10, 600);
        _gameObjects.add(_topWall);
        _gameObjects.add(_bottomWall);
        _gameObjects.add(_rightWall);
        _gameObjects.add(_leftWall);
        createBricks();
        for(go in _gameObjects)
            _stage.addChild(go);

        _stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
        _stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
        _stage.addEventListener(Event.ENTER_FRAME, update);
    }

    public function createBricks() {
        for(i in 0...5) {
            for(j in 0...6) {
                var color:Int = (((j+i) % 2) == 0) ? 0x00ff00 : 0xff0000;
                _gameObjects.add(new Brick((j+1) * Constants.BRICK_WIDTH, i * Constants.BRICK_HEIGHT, color));
            }
        }
    }

    public function update(evt:Event):Void {
        for(go in _gameObjects) {
            go.update(1);
           _ball.update(30);
        }

        if (_keys[39])
            _paddle.move(new Point(1,0));
        else if (_keys[37])
            _paddle.move(new Point(-1,0));
        else
            _paddle.move(new Point(0,0));
        graphics.clear();
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