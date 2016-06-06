
import flash.geom.Point;
import flash.events.Event;

class Ball extends DynamicObject {

    var color:Int;

    public function new(xCord:Int, yCord:Int, color:Int) {
        super(new Point(1, 1), 3);
        this.color = color;
        this.x = xCord;
        this.y = yCord;
        draw();
        addEventListener(Event.ENTER_FRAME, enterFrameEvents);
    }

    public override function draw():Void {
        this.graphics.beginFill(color);
        this.graphics.drawCircle(x, y, 10);
        this.graphics.endFill();
    }

    public override function move(direction:Point):Void{
        var rightW:Wall = Main.getInstance().get__board()._rightWall;
        var leftW:Wall = Main.getInstance().get__board()._leftWall;
        var bottomtW:Wall = Main.getInstance().get__board()._bottomWall;
        var topW:Wall = Main.getInstance().get__board()._topWall;

        //if the ball hits the right side
        if(x >= topW.wWidth -40) {
            speed.x *= -1;
        }
        //if the ball hits the left side
        if(x <= 0) {
            speed.x *= -1;
        }
        //if the ball hits the bottom
        if(y >= rightW.wHeight-130) {
            speed.y *= -1;
        }
        //if the ball hits the top
        if(y <= 0-100) {
            speed.y *= -1;
        }
    }

    public function calcBallAngle(paddle:GameObject):Void{
        //ballPosition is the position of the ball is on the paddle
        var ballPosition:Int = Math.round(x - paddle.x);

        //hitPercent converts ballPosition into a percent
        //All the way to the left is -.5
        //All the way to the right is .5
        //The center is 0
        var hitPercent:Int = Math.round((ballPosition / (120 - 30)) - .5);
        //Gets the hitPercent and makes it a larger number so the
        //ball actually bounces
        //speed.x = hitPercent * 0.3;
        //Making the ball bounce back up
        speed.y *= -1;
    }


    private function enterFrameEvents(event:Event):Void{
        move(new Point(0,0));
    }
}
