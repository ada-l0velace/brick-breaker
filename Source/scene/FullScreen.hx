package scene;

import haxe.ui.toolkit.core.interfaces.IDisplayObject;
import haxe.ui.toolkit.core.Root;
import haxe.ui.toolkit.core.RootManager;
import haxe.ui.toolkit.core.Toolkit;

/**
* A scene that ocuppies the entire screen.
**/
class FullScreen extends Scene {

    public function new() {
        super();
        view = Toolkit.processXmlResource("assets/ui/layout/main-menu.xml");
    }

    public override function show() : Void {

        //Remove old scenes.
        RootManager.instance.destroyAllRoots();

        //Shows
        Toolkit.openFullscreen(function(root:Root) {
            this.root = root;
            root.addChild(view);
        });

    }
}