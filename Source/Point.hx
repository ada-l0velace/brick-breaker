package;

class Point {
    var x : Int;
    var y : Int;

    public function getX():Int {return x;}
    public function getY():Int {return y;}
    public function setX(x:Int):Void {this.x = x;}
    public function setY(y:Int):Void {this.y = y;}



    public function new(x,y) {
        this.x = x;
        this.y = y;
    }

    public function toString() {
        return "Point("+x+","+y+")";
    }
}
