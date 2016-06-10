import scene.LevelMenu;
import flash.geom.Point;
import flash.events.Event;
import openfl.Assets;
import openfl.media.Sound;

class Ball extends DynamicObject {

    var color:Int;
	// 4 5
    public function new(xCord:Float, yCord:Float, color:Int) {
        super(30, 30, new Point(0, 0), 120);
        this.color = color;
        draw();
        this.x = xCord;
        this.y = yCord;
    }

    public override function draw():Void {
        this.graphics.beginFill(color);
        this.graphics.drawCircle(0, 0, 10);
        this.graphics.endFill();
    }

    public function bounce(i:Intersection):Void {
        switch (i) {
            case Intersection.UP: speed.y = -Math.abs(speed.y);
            case Intersection.DOWN: speed.y = Math.abs(speed.y);
            case Intersection.LEFT: speed.x = -Math.abs(speed.x);
            case Intersection.RIGHT: speed.x = Math.abs(speed.x);
            case Intersection.NONE:
        }
    }

    public override function move(x:Float, y:Float):Void{
        var rightW:Wall = Main.getInstance().get__board()._rightWall;
        var leftW:Wall = Main.getInstance().get__board()._leftWall;
        var bottomtW:Wall = Main.getInstance().get__board()._bottomWall;
        var topW:Wall = Main.getInstance().get__board()._topWall;

        //if the ball hits the right side
        if (this.x >= topW.widthO + topW.x && speed.x > 0) {
            speed.x *= -1.2;
        }
        //if the ball hits the left side
        if (this.x  <= leftW.x && speed.x <= 0) {
            speed.x *= -1.2;
        }
        //if the ball hits the bottom
        if(this.y >= rightW.heightO + rightW.y && speed.y > 0) {
			speed.y *= -1;
			Main.getInstance().get__board().remove();
            //Assets.getSound("assets/sounds/gameover.ogg").play();
			new LevelMenu().show();
        }
        //if the ball hits the top
        if (this.y <= topW.y && speed.y < 0) {
            speed.y *= -1;
        }
    }

    public function calcBallAngle(paddle:GameObject):Void{
        var ballPosition:Int = Math.round(x - paddle.x);
        //hitPercent converts ballPosition into a percent
        //All the way to the left is -.5
        //All the way to the right is .5
        //The center is 0
        //var hitPercent:Int = Math.round(((ballPosition / (paddle.widthO - 15)) - .5)*4);
        //Gets the hitPercent and makes it a larger number so the
        //ball actually bounces
        //speed.x = hitPercent * 1.5;
		trace(ballPosition + " " + paddle.widthO + " " + paddle.x + " " + x);
		if ((ballPosition / (paddle.widthO) > 0.5))
			speed.x = Math.round((ballPosition / paddle.widthO + 0.8)) *2.25;
		else 
			speed.x = Math.round((ballPosition / paddle.widthO - 0.8)) *2.25;
		//Making the ball bounce back up
		if (speed.y > 0)
			speed.y *= -1;
    }

}