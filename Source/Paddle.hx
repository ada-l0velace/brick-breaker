package ;
import openfl.geom.Point;
import openfl.events.Event;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.display.Tilesheet;

class Paddle extends DynamicObject {
    

    public override function draw():Void {
        var img:Bitmap = new Bitmap(Assets.getBitmapData("assets/ui/paddle.png"));
        img.width = widthO;
        img.height = heightO;
        addChild(img);
        /*
        this.graphics.beginFill(0xff0000);
        this.graphics.drawRect(0, 0, widthO, heightO);
        this.graphics.endFill();*/
    }

    public function new(xCord:Float, yCord:Float, width:Float, height:Float) {
        super(width, height, new Point(0,0), 600);
        draw();
        x = xCord;
        y = yCord;
    }

    public override function update(delta_t:Float) {
        var rightW:Wall = Main.getInstance().get__board()._rightWall;
        var leftW:Wall = Main.getInstance().get__board()._leftWall;
        var bottomtW:Wall = Main.getInstance().get__board()._bottomWall;
        var topW:Wall = Main.getInstance().get__board()._topWall;
        //trace(x + " " + topW.wWidth);
        
        //if the paddle hits the right side
        if(x >= topW.width - width + leftW.x -10 && speed.x > 0) {
            speed.x = 0;
        }
        //if the paddle hits the left side
        if(x <= leftW.x + 10 && speed.x < 0) {
            speed.x = 0;
        }
        var b:Ball = Main.getInstance().get__board().get__ball();
        if(this.hitTestObject(b)){
            b.calcBallAngle(this);
        }
        super.update(delta_t);
    }
}