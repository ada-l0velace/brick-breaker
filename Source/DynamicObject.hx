package;
import flash.geom.Point;

class DynamicObject extends GameObject {
    @:isVar public var speed(get, set):Point;
    var SPEED_MULTIPLIER:Int = 1;

    function get_speed() { return speed; }

    function set_speed(speed:Point) {
        speed.x *= SPEED_MULTIPLIER;
        return this.speed = speed;
    }

    public override function move(direction:Point):Void {
        speed = direction;
    }

    public function new(speed:Point) {
        super();
        this.speed = speed;
    }
    public override function update(delta_t:Float):Void {
        x += speed.x / delta_t;
        y += speed.y / delta_t;
    }
}
