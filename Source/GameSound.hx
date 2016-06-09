package ;
import openfl.Assets;
import openfl.media.Sound;
import openfl.media.SoundChannel;
import openfl.events.Event;

class GameSound {
    var sound:Sound;
    var name:String;
    var myChannel:SoundChannel;
    var path:String = "assets/sounds/";
    public function new(name:String) {
        var soundExt:String;
        #if flash
        soundExt= "mp3";
        #else
        soundExt= "ogg";
        #end
        this.name = name;
        sound = Assets.getSound(path + name + "." + soundExt);
        myChannel = sound.play(0, 9999);
        myChannel.addEventListener(Event.SOUND_COMPLETE, onSoundChannelSoundComplete);
    }

    function onSoundChannelSoundComplete(e:Event):Void{
        myChannel = sound.play();
    }

}
