package;
import openfl.display.Sprite;

class GameObject extends Sprite {
    public function new() {
        super();
    }
    public function draw():Void {}
    public function update(delta_t:Float):Void {}
    public function move(direction:Point):Void {}
    public inline function checkColision(xCord:Int, yCord:Int):Bool {
        return ((xCord >= x) && (xCord <= x + width) && ((yCord >= y) && (yCord <= y + height))) ? true : false;
    }
}
