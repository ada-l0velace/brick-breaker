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
        super(new Point(0,0), 2);
        x = xCord;
        y = yCord;
        draw();
        addEventListener(Event.ENTER_FRAME, enterFrameEvents);
    }

    private function enterFrameEvents(event:Event):Void{
        //hit testing with the ball
        var b:Ball = Main.getInstance().get__board().get__ball();
        if(this.hitTestObject(b)){
            //making the ball bounce off vertically
            //b.move(new Point(0,0));
            b.calcBallAngle(this);
        }
    }

}