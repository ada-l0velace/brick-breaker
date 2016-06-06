package scene;

import haxe.ui.toolkit.core.Toolkit;
import haxe.ui.toolkit.containers.SpriteContainer;

import Main;

/*
    The game scene
*/
class GameScene extends FullScreen {

    private var level: Int;

    public function new(level: Int) {
        super();

        this.level = level;

        //Layout
        view = Toolkit.processXmlResource("assets/ui/layout/game.xml");

        //The game will be added to the scene dynamically.
        //view.addChild(new SpriteContainer(Main.getInstance().get__board()));
        var board:Board = new Board(1,1, this);
        Main.getInstance().set__board(board);
        view.addChildAt(new SpriteContainer(board), 0);
        //view.addChild(Main.getInstance().get__board())

    }

    public override function show() {
        super.show();

        //Last trigger the event that the game starts
        //systemEvents.LOAD_LEVEL.dispatch(new Level(level));
    }

} 