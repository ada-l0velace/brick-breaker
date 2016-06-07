package;
import Constants as C;
import scene.Scene;

import debug.FpsMem;

import flash.Lib;
import openfl.display.Sprite;
import flash.events.Event;
import openfl.events.KeyboardEvent;
import flash.geom.Point;
import haxe.ui.toolkit.containers.SpriteContainer;

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
    // Time of last step - for calculating time deltas...
    var mLastStep:Float;
    var mStepsPerSecond:Float;

    var _keys:Map<Int, Bool> = new Map<Int,Bool>();
    var _stage = Lib.current.stage;

    public function new(width:Float, height:Float, sc:Scene) {
        super();
        _gameObjects = new List<GameObject>();
        var fps_mem:FpsMem = new FpsMem(60, 260, 0xfffff);

        addChild(fps_mem);

        createPaddle();
        createWalls();
        createBricks();
        createBall();
        for(go in _gameObjects)
            addChild(go);
        mLastStep = haxe.Timer.stamp();
        Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
        Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
        sc.view.addEventListener(Event.ENTER_FRAME, update);
    }

    public function createPaddle() {
        _paddle = new Paddle(C.PADDLE_X_START, C.PADDLE_Y_START, C.PADDLE_WIDTH, C.PADDLE_HEIGHT);
        _gameObjects.add(_paddle);
    }

    public function createBall() {
        _ball = new Ball(C.BALL_X_START, C.BALL_Y_START,  C.BALL_COLOR);
        _gameObjects.add(_ball);
    }

    public function createWalls() {
        _topWall = new Wall(0, 0, C.WALL_COLOR, C.WINDOW_WIDTH + 10, 10);
        _bottomWall = new Wall(0, C.WINDOW_HEIGHT, C.WALL_COLOR, C.WINDOW_WIDTH + 10, 10);
        _rightWall = new Wall(C.WINDOW_WIDTH, 0, C.WALL_COLOR, 10, C.WINDOW_HEIGHT);
        _leftWall = new Wall(0, 0, C.WALL_COLOR, 10, C.WINDOW_HEIGHT);
        _gameObjects.add(_topWall);
        _gameObjects.add(_bottomWall);
        _gameObjects.add(_rightWall);
        _gameObjects.add(_leftWall);
    }

    public function createBricks() {
        for(i in 0...5) {
            for(j in 0...23) {
                var color:Int = (((j+i) % 2) == 0) ? 0x00ff00 : 0xff0000;
                _gameObjects.add(new Brick((j+0.2) * C.BRICK_WIDTH, (i+0.4) * C.BRICK_HEIGHT, color, C.BRICK_WIDTH, C.BRICK_HEIGHT));
            }
        }
    }

    public function update(evt:Event):Void {
        var now = haxe.Timer.stamp();
        // Since the mStepsPerSecond may change in the Update call, make sure
        //  we do all our calculations before we call Update.
        mStepsPerSecond = 100 + 0 * 0.01;

        // Do a number of descrete steps based on the mStepsPerSecond.
        var steps = Math.floor( (now-mLastStep) * mStepsPerSecond );

        mLastStep += steps / mStepsPerSecond;
        var fractional_step = (now-mLastStep) * mStepsPerSecond;

        for(go in _gameObjects) {
            go.update(fractional_step);
            _ball.update(fractional_step);
        }

        if (_keys[39]) {
            _paddle.move(1,0);
        } else if (_keys[37])
            _paddle.move(-1,0);
        else
            _paddle.move(0,0);
        //graphics.clear();
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