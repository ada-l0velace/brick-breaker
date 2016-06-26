
import flash.geom.Point;
import flash.events.Event;
import openfl.Assets;
import openfl.media.Sound;
import openfl.Assets.getBitmapData;
import openfl.display.Bitmap;

class Brick extends StaticObject {

    var destroyed:Bool = false;
    var lives:Int = 1;
    var hits:Int = 0;
    var src:String;

    public function new(xCord:Float, yCord:Float, src:String, width:Float, height:Float) {
        super(width, height);
        this.x = xCord;
        this.y = yCord;
        this.src = src;
        draw();
        //addEventListener(Event.ENTER_FRAME, enterFrameEvents);
        //addEventListener(Event.ENTER_FRAME, update);
    }

    public override function draw():Void {
        if (!destroyed) {
            var img:Bitmap = new Bitmap(Assets.getBitmapData("assets/ui/" + src));
            img.width = widthO;
            img.height = heightO;
            addChild(img);
            
            /*
            this.graphics.beginFill(color);
            this.graphics.drawRect(0, 0, widthO, heightO);
            this.graphics.endFill();
            */
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
                
                if (hits >= lives) {
                    b.bricksDestroyed++;
                    //destroying this brick
                    b.gameSound.brickSound();
                    b.set_score(b.get_score()+200);
                    //this.parent.removeChild(this);
                    visible = false;
                }
                
                destroyed = true;
            }
        }
    }
}
