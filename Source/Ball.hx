
import flash.geom.Point;

class Ball extends DynamicObject {

    var color:Int;

    public override function draw():Void {
        this.graphics.beginFill(color);
        this.graphics.drawCircle(x, y, 10);
        this.graphics.endFill();
    }

    public function new(xCord:Int, yCord:Int, color:Int) {
        super(new Point(0, 1));
        this.color = color;
        this.x = xCord;
        this.y = yCord;
        draw();
    }
}
