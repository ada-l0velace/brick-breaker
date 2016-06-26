import scene.LevelMenu;
import flash.geom.Point;

class Ball extends DynamicObject {

    var color:Int;
    var radius:Int;
    // 4 5
    public function new(xCord:Float, yCord:Float, color:Int) {
        super(20, 20, new Point(0, 0), 120);
        this.color = color;
        this.radius = 10;
        draw();
        this.x = xCord;
        this.y = yCord;
    }

    public override function draw():Void {
        this.graphics.beginFill(color);
        this.graphics.drawCircle(0, 0, radius);
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

    public override function update(delta_t:Float) {
        move(0,0);
        super.update(delta_t);
    }

    public override function move(_:Float, _:Float):Void{
        var rightW:Wall = Main.getInstance().get__board()._rightWall;
        var leftW:Wall = Main.getInstance().get__board()._leftWall;
        var bottomtW:Wall = Main.getInstance().get__board()._bottomWall;
        var topW:Wall = Main.getInstance().get__board()._topWall;

        //if the ball hits the right side
        if (x >= topW.widthO + topW.x - widthO && speed.x > 0) {
            speed.x *= -1.2;
        }
        //if the ball hits the left side
        if (x  <= leftW.x + widthO && speed.x <= 0) {
            speed.x *= -1.2;
        }
        //if the ball hits the bottom
        if(y >= rightW.heightO + rightW.y - heightO && speed.y > 0) {
            speed.y *= -1;
            //(Board) parent.remove();
            Main.getInstance().get__board().remove();
            //Assets.getSound("assets/sounds/gameover.ogg").play();
            new LevelMenu().show();
        }
        //if the ball hits the top
        if (y <= topW.y + heightO && speed.y < 0) {
            speed.y *= -1;
        }
    }

    public function calcBallAngle(paddle:GameObject): Void {
        var ballPosition:Int = Math.round(x - paddle.x);
        var relativeIntersectY = paddle.x + (paddle.widthO / 2) - x;
        var normRelativeIntersectionY = normalizeAngle(relativeIntersectY);
        var bounceAngle = normRelativeIntersectionY;
        speed.x = -Math.sin(bounceAngle * (Math.PI / 180)) * 4;
        //Making the ball bounce back up
        if (speed.y > 0)
            speed.y = -Math.cos(bounceAngle * (Math.PI / 180)) * 5;
    }

    private function normalizeAngle(angle:Float):Float {
        angle = angle % 360;
        angle = (angle + 360) % 360;
        if(angle > 180)
            angle -= 360;
        return angle;
    }

}