
import openfl.display.Sprite;
import flash.Lib;

class Brick extends StaticObject {

    var color:Int = 0xff0000;
    var destroyed:Bool = false;
    var lives:Int = 1;
    var hits:Int = 0;


    public override function checkColision(b:Ball):Bool {
        if(hitRight(b) || hitTop(b) || hitBottom(b) || hitLeft(b)) {
            hits++;
            if(lives >= hits)
                destroyed = true;
            return true;
        }
        return false;
    }

    //Detect if the brick has been hit on its bottom, top, left, or right sides
    public function hitBottom(b:Ball):Bool {
        if ((b.x >= x) && (b.x <= x + width + 1) && (b.y == y + height) && (destroyed == false)) {
            hits++;
            b.y *= -1;
            return true;
        }
        return false;
    }

    public function hitTop(b:Ball):Bool {
        if ((b.x >= x) && (b.x <= x + width + 1) && (b.y == y) && (destroyed == false)) {
            hits++;
            b.y *= -1;
            return true;
        }
        return false;
    }

    public function hitLeft(b:Ball):Bool {
        if ((b.y >= y) && (b.y <= y + height) && (b.x == x) && (destroyed == false)) {
            hits++;
            b.x *= -1;
            return true;
        }
        return false;
    }

    public function hitRight(b:Ball):Bool {
        if ((b.y >= y) && (b.y <= y + height) && (b.x == x + width) && (destroyed == false)) {
            hits++;
            b.x *= -1;
            return true;
        }
        return false;
    }


    public override function draw():Void {
        if (!destroyed) {
            this.graphics.beginFill(color);
            this.graphics.drawRect(this.x, this.y, Constants.BRICK_WIDTH, Constants.BRICK_HEIGHT);
            this.graphics.endFill();
        }
    }

    public function new(xCord:Int, yCord:Int, color:Int) {
        super();
        this.color = color;
        this.x = xCord;
        this.y = yCord;
        draw();
    }

}
