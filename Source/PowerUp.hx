package;

/**
 * ...
 * @author 
 */
abstract PowerUp() extends StaticObject {
    var src:String;
    var time:Int;
    
    private PowerUp(src:String, GameObject parent) {
        parent.add(this);
        this.src = src;
    }
    
    public void turnOn() {}
    public void timeOff() {}
}