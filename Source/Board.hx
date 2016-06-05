package;
import flash.Lib;
import openfl.display.Sprite;
import flash.events.Event;
import openfl.events.KeyboardEvent;
import flash.geom.Point;



class Board extends Sprite {

    var _height:Int;
    var _width:Int;
    var _gameObjects:List<GameObject>;
    var _paddle:Paddle;
    var _ball:Ball;
    var _keys:Map<Int, Bool> = new Map<Int,Bool>();
    var _stage = Lib.current.stage;

    public function new(width:Int, height:Int) {
        super();
        _width = height;
        _height = height;

        _paddle = new Paddle(0, 180);

        _gameObjects = new List<GameObject>();
        _gameObjects.add(_paddle);
        _ball = new Ball(Constants.BALL_X_START, Constants.BALL_Y_START, 0x0);
        this.addChild(_ball);

        createBricks();
        for(go in _gameObjects)
            this.addChild(go);

        _stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
        _stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
        _stage.addEventListener(Event.ENTER_FRAME, update);
    }

    public function createBricks() {
        for(i in 0...5) {
            for(j in 0...6) {
                var color:Int = (((j+i) % 2) == 0) ? 0x00ff00 : 0xff0000;
                _gameObjects.add(new Brick(j * Constants.BRICK_WIDTH, i * Constants.BRICK_HEIGHT, color));
            }
        }
    }

    public function update(evt:Event):Void {
        for(go in _gameObjects) {
            go.update(1);
            _ball.update(30);
            if(go.checkColision(_ball)) {
                _ball.speed.y *= -1;
                _ball.speed.x *= -1;
            }
        }


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
enum GameState {
    Paused;
    Playing;
}