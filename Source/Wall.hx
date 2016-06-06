import flash.geom.Point;
import flash.events.Event;

class Wall extends StaticObject {
    var color:Int;

    public function new(xCord:Float, yCord:Float, color:Int, width:Float, height:Float) {
        super(width, height);
        this.color = color;
        this.x = xCord;
        this.y = yCord;
        draw();
        //addEventListener(Event.ENTER_FRAME, enterFrameEvents);
        //addEventListener(Event.ENTER_FRAME, update);
    }

    public override function draw():Void {
        this.graphics.beginFill(color);
        this.graphics.drawRect(0, 0, widthO, heightO);
        this.graphics.endFill();
    }
}