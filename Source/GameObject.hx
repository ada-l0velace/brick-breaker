package;
import openfl.display.Sprite;
import flash.geom.Point;

class GameObject extends Sprite {
    public function new() {
        super();
    }
    public function draw():Void {}
    public function update(delta_t:Float):Void {}
    public function move(direction:Point):Void {}
    public function checkColision(b:Ball):Bool {
        return false;
    }
}
