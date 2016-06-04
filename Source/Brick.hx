package;
import openfl.display.Sprite;
import flash.Lib;

class Brick extends StaticObject {

    public override function draw():Void {
        this.graphics.beginFill(0xff0000);
        this.graphics.drawRect(x, y, 100, 35);
        this.graphics.endFill();
    }

    public function new(xCord:Int, yCord:Int) {
        super();
        x = xCord;
        y = yCord;
        draw();
    }

}
