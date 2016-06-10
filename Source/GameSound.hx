package ;
import openfl.Assets;
import openfl.media.Sound;
import openfl.media.SoundTransform;
import openfl.media.SoundChannel;
import openfl.events.Event;

class GameSound {
	
	private var SOUND_BRICK: Sound;
    private var SOUND_IDLE: Sound;
	private var SOUND_BUTTON_OVER: Sound;
	private var SOUND_BUTTON_CLICK: Sound;
	private var CHANNEL_IDLE: SoundChannel;
    public function new() {
		var path:String = "assets/sounds/";
        var soundExt:String;
        #if flash
        soundExt= "mp3";
        #else
        soundExt= "ogg";
        #end
        SOUND_IDLE = Assets.getSound(path + "What-Is-Love" + "." + soundExt);
		SOUND_BRICK = Assets.getSound(path + "household038" + "." + soundExt);
		SOUND_BUTTON_OVER = Assets.getSound(path + "click_and_slide" + "." + soundExt);
		SOUND_BUTTON_CLICK = Assets.getSound(path + "household038" + "." + soundExt);
        
    }
	public function onMainMenu() : Void {
		if (new Configuration().VOLUME) {
			CHANNEL_IDLE = SOUND_IDLE.play(0, 9999);
			CHANNEL_IDLE.addEventListener(Event.SOUND_COMPLETE, onSoundChannelSoundComplete);
        }
    }
	
	public function stop() : Void {
		if(CHANNEL_IDLE != null) {
			CHANNEL_IDLE.stop();
			CHANNEL_IDLE.removeEventListener(Event.SOUND_COMPLETE, onSoundChannelSoundComplete);
		
		}
    }
	
	public function brickSound() : Void {
		if (new Configuration().VOLUME)
			SOUND_BRICK.play();
	}
	
	public function buttonClickSound() : Void {
		if (new Configuration().VOLUME)
			SOUND_BUTTON_CLICK.play();
	}
	
	public function buttonOverSound() : Void {
		if (new Configuration().VOLUME)
			SOUND_BUTTON_OVER.play();
	}
	
	function onSoundChannelSoundComplete(e:Event):Void{
		if (new Configuration().VOLUME)
			CHANNEL_IDLE = SOUND_IDLE.play();
    }

}
