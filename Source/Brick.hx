package;
import openfl.display.Sprite;
import flash.Lib;

class Brick extends StaticObject {
    static inline var HEIGHT:Int = 100;
    static inline var WIDTH:Int = 35;

    var color:Int = 0xff0000;
    var destroyed:Bool = false;
    var lives:Int;
    var hits:Int;


    public override function checkColision(xCord:Int, yCord:Int):Bool {
        if(super.checkColision(xCord, yCord)) {
            hits++;
            return true;
        }
        return false;
    }


    public override function draw():Void {
        if (!destroyed) {
            this.graphics.beginFill(color);
            this.graphics.drawRect(this.x, this.y, HEIGHT, WIDTH);
            this.graphics.endFill();
        }
    }

    public function new(xCord:Int, yCord:Int) {
        super();
        this.x = xCord;
        this.y = yCord;
        draw();
    }

}
