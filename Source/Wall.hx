import flash.geom.Point;
import flash.events.Event;

class Wall extends StaticObject {

    public var wHeight:Float;
    public var wWidth:Float;
    var color:Int;

    public function new(xCord:Float, yCord:Float, color:Int, width:Float, height:Float) {
        super();
        this.color = color;
        this.x = xCord;
        this.y = yCord;
        wHeight = height;
        wWidth = width;
        draw();
        //addEventListener(Event.ENTER_FRAME, enterFrameEvents);
        //addEventListener(Event.ENTER_FRAME, update);
    }

    public override function draw():Void {
        this.graphics.beginFill(color);
        this.graphics.drawRect(this.x, this.y, wWidth, wHeight);
        this.graphics.endFill();
    }
}