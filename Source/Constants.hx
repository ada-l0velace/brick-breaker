
class Constants {
    //Window Size
    public static inline var WINDOW_WIDTH:Int = 1200;
    public static inline var WINDOW_HEIGHT:Int = 600;

    //Lives
    public static inline var MAX_LIVES:Int = 5;
    public static inline var MIN_LIVES:Int = 0;

    //Ball
    public static inline var BALL_WIDTH:Float = 10;
    public static inline var BALL_HEIGHT:Float = 10;
    public static inline var BALL_RIGHT_BOUND:Float = 490;
    public static inline var BALL_X_START:Float = 500;
    public static inline var BALL_Y_START:Float = 500;
    public static inline var BALL_COLOR:Int = 0x0;

    //Paddle
    public static inline var PADDLE_WIDTH:Float = 300;
    public static inline var PADDLE_HEIGHT:Float = 10;
    public static inline var PADDLE_RIGHT_BOUND:Float = 430;
    public static inline var PADDLE_X_START:Float = 500;
    public static inline var PADDLE_Y_START:Float = WINDOW_HEIGHT-PADDLE_HEIGHT;
    public static inline var PADDLE_MIN:Float = 35;
    public static inline var PADDLE_MAX:Float = 140;

    //Bricks
    public static inline var BRICK_WIDTH:Float = 50;
    public static inline var BRICK_HEIGHT:Float = 25;
    public static inline var MAX_BRICKS:Float = 50;
    public static inline var NO_BRICKS:Float = 0;

    //Walls
    public static inline var WALL_COLOR:Int = 0x0000FF;
}
