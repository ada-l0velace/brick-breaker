package ;
import flash.geom.Point;
import flash.events.Event;

class Paddle extends DynamicObject {

    public override function draw():Void {
        this.graphics.beginFill(0xff0000);
        this.graphics.drawRect(x, y, 100, 35);
        this.graphics.endFill();
    }

    public function new(xCord:Float, yCord:Float) {
        trace(xCord + " " + yCord);
        super(new Point(0,0), 5);
        x = xCord;
        y = yCord;
        draw();
        addEventListener(Event.ENTER_FRAME, enterFrameEvents);
    }

    public override function update(delta_t:Float) {
        var rightW:Wall = Main.getInstance().get__board()._rightWall;
        var leftW:Wall = Main.getInstance().get__board()._leftWall;
        var bottomtW:Wall = Main.getInstance().get__board()._bottomWall;
        var topW:Wall = Main.getInstance().get__board()._topWall;
        trace(x + " " + topW.wWidth);

        //if the ball hits the right side
        if(x+376 >= topW.wWidth -40 && speed.x > 0) {
            speed.x = 0;
        }
        //if the ball hits the left side
        if(x+290 <= 0 && speed.x < 0) {
            speed.x = 0;
        }

        super.update(delta_t);
    }

    private function enterFrameEvents(event:Event):Void{
        //hit testing with the ball
        //update(1);
        var b:Ball = Main.getInstance().get__board().get__ball();
        if(this.hitTestObject(b)){
            //making the ball bounce off vertically
            //b.move(new Point(0,0));
            b.calcBallAngle(this);
        }
    }

}