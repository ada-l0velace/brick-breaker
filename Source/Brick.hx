
import flash.geom.Point;
import flash.events.Event;

class Brick extends StaticObject {

    var color:Int = 0xff0000;
    var destroyed:Bool = false;
    var lives:Int = 1;
    var hits:Int = 0;

    public function new(xCord:Int, yCord:Int, color:Int) {
        super();
        this.color = color;
        this.x = xCord;
        this.y = yCord;
        draw();
        addEventListener(Event.ENTER_FRAME, enterFrameEvents);
        //addEventListener(Event.ENTER_FRAME, update);
    }

    public override function draw():Void {
        if (!destroyed) {
            this.graphics.beginFill(color);
            this.graphics.drawRect(this.x, this.y, Constants.BRICK_WIDTH, Constants.BRICK_HEIGHT);
            this.graphics.endFill();
        }
    }

    private function enterFrameEvents(event:Event):Void{
        //hit testing with the ball
        var b:Ball = Main.getInstance().get__board().get__ball();
        if(this.hitTestObject(b)){
            //making the ball bounce off vertically
            b.speed.y *= -1;
            hits++;
            //destroying this brick
            if (hits >= lives)
                this.parent.removeChild(this);
            destroyed = true;
            //stop running this code
            removeEventListener(Event.ENTER_FRAME, enterFrameEvents);
        }
    }

}
