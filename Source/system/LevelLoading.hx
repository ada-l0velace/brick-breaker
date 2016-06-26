package system;


import Constants as C;
import openfl.Assets;
import haxe.Json;

/*
    Loads at the beginning of the game, the objects of a level.
*/
class LevelLoading {

    private var data:Dynamic; //Json file stores the entities
    private var board:Board;


    public function new(board:Board) {
        this.board = board;
        onLoadLevel(board.level);
    }




    //Loads the level
    private function onLoadLevel(level:Int) : Void {
        //Set Current Level
        // this.level = null;

        //Parses the level
        parseLevel(Json.parse( Assets.getText("assets/levels/level" + level + ".json") ));


    }

    //Reads level file and creates entities.
    private function parseLevel(json: Dynamic) : Void {

        //read json document
        data = json;
        var rows: Array<Dynamic> = data.array;
        var i = 0;
        var j = 0;
        for(row in rows) {
            var columns: Array<Dynamic> = row;
            j = 0;
            for(column in columns) {
                if(column == 1) {
                    var src:String = (((j+i) % 2) == 0) ? "brick-red.png" : "dark-brick.png";
                    trace((j+0.1) * C.BRICK_WIDTH + C.BRICK_X_START);
                    board._gameObjects.add(new Brick((j+0.1) * C.BRICK_WIDTH + C.BRICK_X_START, (i+0.4) * C.BRICK_HEIGHT+C
                    .BRICK_Y_START, src, C.BRICK_WIDTH, C.BRICK_HEIGHT));
                    board.totalBricks++;
                }
                j++;
            }
            i++;
        }

    }

}