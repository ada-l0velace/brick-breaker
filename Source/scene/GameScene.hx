package scene;

import haxe.ui.toolkit.core.Toolkit;
import haxe.ui.toolkit.containers.SpriteContainer;
import haxe.ui.toolkit.controls.Text;
import Main;
import haxe.Timer;
import openfl.events.Event;
import openfl.system.System;


/*
    The game scene
*/
class GameScene extends FullScreen {

    private var level: Int;
    private var fps: Text;
    private var memF: Text;
    private var times:Array<Float>;
    private var memPeak:Float = 0;
    public function new(level: Int) {
        super();

        this.level = level;
        times = [];
        //Layout
        view = Toolkit.processXmlResource("assets/ui/layout/game.xml");
        view.findChild("score", Text, true).text = "Score: 0";
        view.findChild("balls-remaining", Text, true).text = "Balls Remaining: 0";
        fps = view.findChild("fps", Text, true);
        memF = view.findChild("total-memory", Text, true);
        //The game will be added to the scene dynamically.
        //view.addChild(new SpriteContainer(Main.getInstance().get__board()));
        var board:Board = new Board(1,1, this);
        Main.getInstance().set__board(board);
        view.addChildAt(new SpriteContainer(board), 0);
        //view.addChild(Main.getInstance().get__board())
        view.addEventListener(Event.ENTER_FRAME, onEnter);

    }

    public override function show() {
        super.show();

        //Last trigger the event that the game starts
        //systemEvents.LOAD_LEVEL.dispatch(new Level(level));
    }

    private function onEnter(_)  {
        var now = Timer.stamp();
        times.push(now);

        while (times[0] < now - 1)
            times.shift();

        trace(System.totalMemory);
        var mem:Float = Math.round(System.totalMemory / 1024 / 1024 * 100)/100;
        if (mem > memPeak) memPeak = mem;
        fps.text = "FPS: " + times.length;
        memF.text = "MEM: " + mem + " MB MEM peak: " + memPeak + " MB";
    }

} 