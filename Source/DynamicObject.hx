package;
import flash.geom.Point;

class DynamicObject extends GameObject {
    @:isVar public var speed(get, set):Point;
    var velocity:Float;

    function get_speed() { return speed; }

    function set_speed(speed:Point) {
        return this.speed = speed;
    }

    public function new(width:Float, height:Float, speed:Point, velocity:Float) {
        super(width, height);
        this.velocity = velocity;
        this.speed = speed;
    }

    public override function move(direction:Point):Void {
        //speed.x = direction.x;
        //speed.y = direction.y;
        speed = direction;
    }

    public override function update(delta_t:Float):Void {
        var h:Float = velocity * delta_t;
        //trace(x + " " + y + " " + speed);
        x += speed.x * h;
        y += speed.y * h;
       //trace(x + " " + y + " " + speed);
    }
}
