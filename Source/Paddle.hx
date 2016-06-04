package ;

class Paddle extends DynamicObject {

    public override function draw():Void {
        this.graphics.beginFill(0xff0000);
        this.graphics.drawRect(x, y, 100, 35);
        this.graphics.endFill();
    }

    public override function move(direction:Point):Void {
        speed = direction;
    }

    public function new(xCord:Int, yCord:Int) {
        super(new Point(0,0));
        x = xCord;
        y = yCord;
        draw();
    }

}