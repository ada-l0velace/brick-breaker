package ;
import openfl.net.SharedObject;

//Configuration file to store options and Level Scores
class Configuration {

    private static inline var id: String = "configuration";

    public var DEBUG: Bool;
    public var VOLUME: Bool;
    public var FULLSCREEN: Bool;
    public var LEVEL: Int;
    public var HIGHSCORES: Array<Float>;
    public var TOTALLEVELS: Int; //Number of all levels ( count starts at 1 )


    public function new() {
        load();
        this.TOTALLEVELS = 9;
    }

    public function load() : Void {

        //Read File
        var io: SharedObject = SharedObject.getLocal(id);

        //Values ​​read out , if they are set
        DEBUG = (io.data.DEBUG == null) ? false : io.data.DEBUG;
        FULLSCREEN = (io.data.FULLSCREEN == null) ? false : io.data.FULLSCREEN;
        VOLUME = (io.data.VOLUME == null) ? true : io.data.VOLUME;
        LEVEL = (io.data.LEVEL == null) ? 0 : io.data.LEVEL;
        HIGHSCORES = (io.data.HIGHSCORES == null) ? [0] : io.data.HIGHSCORES;


    }

    public function save() : Void {

        //Read File
        var io: SharedObject = SharedObject.getLocal(id);

        //Write values ​​in file
        io.data.DEBUG = DEBUG;
        io.data.FULLSCREEN = FULLSCREEN;
        io.data.VOLUME = VOLUME;
        io.data.LEVEL = LEVEL;
        io.data.HIGHSCORES = HIGHSCORES;

        //write file to disk
        try {
            io.flush();
        } catch(e: Dynamic) {
            throw "Couldn't save configuration: " + e;
        }

    }

    public function clear() : Void {
        //read file
        var io: SharedObject = SharedObject.getLocal(id);
        //delete data
        io.clear();
        load();
    }
}
