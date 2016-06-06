package;
import flash.geom.Point;

class DynamicObject extends GameObject {
    @:isVar public var speed(get, set):Point;
    var velocity:Int;

    function get_speed() { return speed; }

    function set_speed(speed:Point) {
        speed.x *= velocity;
        return this.speed = speed;
    }

    public override function move(direction:Point):Void {
        //speed.x = direction.x;
        //speed.y = direction.y;
        speed = direction;
    }

    public function new(speed:Point, velocity:Int) {
        super();
        this.velocity = velocity;
        this.speed = speed;
    }
    public override function update(delta_t:Float):Void {
        var h:Float = velocity / delta_t;
        x += speed.x * h;
        y += speed.y * h;
    }
}
