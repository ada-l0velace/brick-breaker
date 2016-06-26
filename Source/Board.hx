package;

import system.LevelLoading;
import Constants as C;

import scene.Scene;
import scene.PauseScene;
import scene.GameBeatenScene;

import openfl.Lib;
import openfl.ui.Keyboard;
import openfl.events.Event;
import openfl.Vector.Vector;
import openfl.display.Sprite;
import openfl.events.KeyboardEvent;

import haxe.ui.toolkit.controls.Text;

class Board extends Sprite {

    @:isVar var _ball(get, null):Ball;
    @:isVar var score(get, set):Int;
    @:isVar var scene(get, set):Scene;

    public var _gameObjects:List<GameObject>;
    var _paddle:Paddle;
    
    var _start:Bool;
    
    public var gameSound:GameSound;
    
    public var totalBricks:Int = 0;
    public var bricksDestroyed:Int = 0;
    
    public var _topWall:Wall;
    public var _bottomWall:Wall;
    public var _rightWall:Wall;
    public var _leftWall:Wall;
    
    public var running: Bool;
    var delete = false;

    public var level: Int;

    // Time of last step - for calculating time deltas...
    var mLastStep:Float;
    var mStepsPerSecond:Float;
    var _keys:Map<Int, Bool> = new Map<Int,Bool>();
    var _stage = Lib.current.stage;


    public function new(sc:Scene, level:Int) {
        this.level = level;
        gameSound = new GameSound();
        gameSound.onMainMenu();
        super();
        init(sc);
    }

    private function init(sc:Scene) {
        Lib.current.stage.focus = this;
        _gameObjects = new List<GameObject>();
        score = 0;
        running = true;
        _start = true;


        createPaddle();
        createWalls();
        var l:LevelLoading = new LevelLoading(this);
        //createBricks();
        createBall();

        //createBoundaries();
        for(go in _gameObjects)
            addChild(go);
        mLastStep = haxe.Timer.stamp();
        scene = sc;
        Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
        Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
        sc.view.addEventListener(Event.ENTER_FRAME, update);
    }

    private function createPaddle() {
        _paddle = new Paddle(C.PADDLE_X_START, C.PADDLE_Y_START, C.PADDLE_WIDTH, C.PADDLE_HEIGHT);
        _gameObjects.add(_paddle);
    }

    private function createBall() {
        _ball = new Ball(C.BALL_X_START, C.BALL_Y_START,  C.BALL_COLOR);
        _gameObjects.add(_ball);
    }

    private function createWalls() {
        _topWall = new Wall(C.TOP_WALL_X_START, C.TOP_WALL_Y_START,C.WALL_COLOR, C.WINDOW_WIDTH + 10, 10);
        _bottomWall = new Wall(C.BOT_WALL_X_START, C.BOT_WALL_Y_START, C.WALL_COLOR, C.WINDOW_WIDTH + 10, 10);
        _rightWall = new Wall(C.RIGHT_WALL_X_START+10, C.RIGHT_WALL_Y_START, C.WALL_COLOR, 10, C.WINDOW_HEIGHT- C.UI_TOP_WINDOW_HEIGHT);
        _leftWall = new Wall(C.LEFT_WALL_X_START, C.LEFT_WALL_Y_START, C.WALL_COLOR, 10, C.WINDOW_HEIGHT- C.UI_TOP_WINDOW_HEIGHT);
        _gameObjects.add(_topWall);
        _gameObjects.add(_bottomWall);
        _gameObjects.add(_rightWall);
        _gameObjects.add(_leftWall);
        
    }

    private function createBricks() {
        for(i in 0...5) {
            for(j in 0...5) {
                var src:String = (((j+i) % 2) == 0) ? "brick-red.png" : "dark-brick.png";
                _gameObjects.add(new Brick((j+0.1) * C.BRICK_WIDTH + C.BRICK_X_START, (i+0.4) * C.BRICK_HEIGHT+C.BRICK_Y_START, src, C
                .BRICK_WIDTH, C.BRICK_HEIGHT));
                totalBricks++;
            }
        }
    }
    
    /**
        Checks if the game started if not, the ball starts moving.
    **/
    private function isGameStarted() {
        if (_keys[Keyboard.SPACE] && _start) { 
            _start = false;
            _ball.speed.x = 0;
            _ball.speed.y = 5;
        }
    }

    /**
        Checks if the game is lost, destroys the current game screen 
        and shows ups the defeat one    
    **/
    private function isGameWon() {
        if (bricksDestroyed >= totalBricks) {
            remove();
            var cf:Configuration = new Configuration();
            cf.LEVEL++;
            cf.save();
            new GameBeatenScene().show();
        }
    }
    
     /**
         Sets up the required variables to pause the game.
     **/
    private function onGamePause() : Void {
        running = false;
    }

    /**
         Sets up the required variables to unpause the game.
     **/
    private function onGameUnpause() : Void {
        running = true;
    }

     /**
         Game loop update function.
     **/
    private function update(evt:Event):Void {
        if(!delete) {
            graphics.clear();
            var now = haxe.Timer.stamp();
            var delta_t = now - mLastStep + level * 0.001;
            mLastStep = now;
            if (running) {
                
                for(go in _gameObjects) {
                    go.update(delta_t);
                    go.handleInput(_keys);
                }
                if(!delete) {
                    isGameStarted();
                    scene.view.findChild("score", Text, true).text = "Score: " + score;
                    isGameWon();
                }
            }
        }
    }
    
    //Key events
    private function onKeyDown(evt:KeyboardEvent):Void {
        _keys[evt.keyCode] = true;
    }

    private function onKeyUp(evt:KeyboardEvent):Void {
        if (evt.keyCode == Keyboard.ESCAPE) {
            if(running) {
                running = !running;
                new PauseScene().show();
            }
        }
        _keys[evt.keyCode] = false;
    }
    
    //Object destruction
    public function remove() {
        Lib.current.stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
        Lib.current.stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyUp);
        removeEventListener(Event.ENTER_FRAME, update);	
        delete = true;
        scene.close();
        for (go in _gameObjects)
            removeChild(go);
        gameSound.stop();
    }
    
    //Geters and seters
    public function get__ball():Ball {
        return _ball;
    }
    public function get_score():Int {
        return score;
    }
    
    public function set_score(value:Int):Int {
        return score = value;
    }
    
    public function get_scene():Scene {
        return scene;
    }
    
    public function set_scene(value:Scene):Scene {
        return scene = value;
    }

}