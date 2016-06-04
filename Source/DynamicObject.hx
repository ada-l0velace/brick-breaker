package;

class DynamicObject extends GameObject {
    @:isVar public var speed(get, set):Point;
    var SPEED_MULTIPLIER:Int = 4;

    function get_speed() {
        return speed;
    }

    function set_speed(speed:Point) {
        speed.setX(speed.getX() * SPEED_MULTIPLIER);
        return this.speed = speed;
    }

    public function new(speed:Point) {
        super();
        this.speed = speed;
    }
    public override function update(delta_t:Float):Void {
        x += speed.getX()*delta_t;
    }
}
