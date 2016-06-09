package;
import openfl.display.Sprite;
import flash.geom.Point;

class GameObject extends Sprite {

    var widthO:Float;
    var heightO:Float;

    public function new(width:Float, height:Float) {
        super();
        widthO = width;
        heightO = height;
    }
    public function draw():Void {}
    public function update(delta_t:Float):Void {}
    public function move(x:Float, y:Float):Void {}
    public function checkColision(other:GameObject):Intersection {
        if (other.x > x + widthO
        || other.y > y + heightO
        || other.x + other.widthO  < x
        || other.y + other.heightO < y)
            return Intersection.NONE;

        // compute the vector from the center of this object to the center of
        // the other
        var dx:Float = other.x + other.widthO /2 - (x + widthO /2);
        var dy:Float = other.y + other.heightO /2 - (y + heightO /2);

        var theta:Float = Math.atan2(dy, dx);
        var diagTheta:Float = Math.atan2(heightO, widthO);

        if ( -diagTheta <= theta && theta <= diagTheta )
            return Intersection.RIGHT;
        if ( diagTheta <= theta && theta <= Math.PI - diagTheta )
            return Intersection.DOWN;
        if ( Math.PI - diagTheta <= theta || theta <= diagTheta - Math.PI )
            return Intersection.LEFT;
        // if ( diagTheta - Math.PI <= theta && theta <= diagTheta)
        return Intersection.UP;
    }
}
