package scene;
import haxe.ui.toolkit.core.interfaces.IDisplayObjectContainer;
import haxe.ui.toolkit.core.Root;
import haxe.ui.toolkit.core.RootManager;

class Scene {

    public var view: IDisplayObjectContainer;
    public var root: Root;

    public function new() {

    }

    public function show() : Void {

    }

    public function close() : Void {
        RootManager.instance.destroyRoot(root);
    }
}