
class Constants {
    //UI top bar
    public static inline var UI_TOP_WINDOW_WIDTH:Int = 600;
    public static inline var UI_TOP_WINDOW_HEIGHT:Int = 80;

    //Window Size
    public static inline var WINDOW_WIDTH:Int = 600;
    public static inline var WINDOW_HEIGHT:Int = 700;
	public static inline var WINDOW_X_START:Int = 500 + 600;
    public static inline var WINDOW_Y_START:Int = 700;

    //Lives
    public static inline var MAX_LIVES:Int = 5;
    public static inline var MIN_LIVES:Int = 0;

    //Ball
    public static inline var BALL_WIDTH:Float = 10;
    public static inline var BALL_HEIGHT:Float = 10;
    public static inline var BALL_RADIUS:Float = 30;
    public static inline var BALL_RIGHT_BOUND:Float = 490;
	
    public static inline var BALL_X_START:Float = PADDLE_X_START + PADDLE_WIDTH/2;
    public static inline var BALL_Y_START:Float = PADDLE_Y_START - BALL_RADIUS / 2;
	
    public static inline var BALL_COLOR:Int = 0xFFFFFF;

    //Paddle
    public static inline var PADDLE_WIDTH:Float = 100;
    public static inline var PADDLE_HEIGHT:Float = 10;
    public static inline var PADDLE_RIGHT_BOUND:Float = 430;
	
    public static inline var PADDLE_X_START:Float = 500 + WINDOW_WIDTH/2 - PADDLE_WIDTH/2;
    public static inline var PADDLE_Y_START:Float = WINDOW_HEIGHT - PADDLE_HEIGHT - 10;
	
    public static inline var PADDLE_MIN:Float = 35;
    public static inline var PADDLE_MAX:Float = 140;

    //Bricks
    public static inline var BRICK_WIDTH:Float = 118;
    public static inline var BRICK_HEIGHT:Float = 25;
	public static inline var BRICK_X_START:Float = 500;
    public static inline var BRICK_Y_START:Float = 0 + UI_TOP_WINDOW_HEIGHT;
    public static inline var MAX_BRICKS:Float = 50;
    public static inline var NO_BRICKS:Float = 0;

    //Walls
    public static inline var WALL_COLOR:Int = 0x0000FF;
	
    public static inline var TOP_WALL_X_START:Float = 500;
    public static inline var TOP_WALL_Y_START:Float = 0 + UI_TOP_WINDOW_HEIGHT;

    public static inline var BOT_WALL_X_START:Float = 500;
    public static inline var BOT_WALL_Y_START:Float = WINDOW_HEIGHT-10;

    public static inline var RIGHT_WALL_X_START:Float = 500 +WINDOW_WIDTH-10;
    public static inline var RIGHT_WALL_Y_START:Float = 0 + UI_TOP_WINDOW_HEIGHT;

    public static inline var LEFT_WALL_X_START:Float = 500;
    public static inline var LEFT_WALL_Y_START:Float = 0 + UI_TOP_WINDOW_HEIGHT;

}
