package;

import flixel.addons.util.FlxFSM;
import flixel.input.gamepad.FlxGamepad;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class Goo extends FlxSprite {

    private var speed:Int = 225;

    public function new(X:Float = 0, Y:Float = 0) {

        super(X, Y);
        loadGraphic("assets/spit.png", true, 16, 16);

    }

    public function expellGoo() {



    }

    override public function update(elapsed:Float):Void {
	
		super.update(elapsed);

	}
}