
import flash.geom.Point;
import flash.events.Event;
import openfl.Assets;
import openfl.media.Sound;

class Brick extends StaticObject {

    var color:Int = 0xff0000;
    var destroyed:Bool = false;
    var lives:Int = 1;
    var hits:Int = 0;

    public function new(xCord:Float, yCord:Float, color:Int, width:Float, height:Float) {
        super(width, height);
        this.color = color;
        this.x = xCord;
        this.y = yCord;
        draw();
        //addEventListener(Event.ENTER_FRAME, enterFrameEvents);
        //addEventListener(Event.ENTER_FRAME, update);
    }

    public override function draw():Void {
        if (!destroyed) {
            this.graphics.beginFill(color);
            this.graphics.drawRect(0, 0, widthO, heightO);
            this.graphics.endFill();
        }
    }
	public override function update(delta_t:Float):Void {
		if (!destroyed) {
			var b:Ball = Main.getInstance().get__board().get__ball();
			var i:Intersection;
			i = checkColision(b);
			b.bounce(i);
			if(i != Intersection.NONE){
			    var m:Main = Main.getInstance();
				var b:Board = m.get__board();
				hits++;
				b.bricksDestroyed++;
				//destroying this brick
				b.gameSound.brickSound();
				if (hits >= lives) {
					b.set_score(b.get_score()+200);
					//this.parent.removeChild(this);
					visible = false;
				}
				
				destroyed = true;
			}
		}
	}
}
