package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.util.FlxColor;
import flixel.group.FlxGroup;
import flixel.input.gamepad.FlxGamepad;
using StringTools;

class PlayState extends FlxState
{
	private var _map:FlxTilemap;
	private var _slime:Slime;
	private var _powerup:FlxSprite;
	private var sprite:FlxSprite;
	public var playerGoo:FlxTypedGroup<FlxSprite>;
	
	private var _info:String = "LEFT & RIGHT to move, UP to jump\nDOWN (in the air) " +
		"to ground-pound.\nR to Reset\n\nCurrent State: {STATE}";
	private var _txtInfo:FlxText;
	
	override public function create():Void
	{
		bgColor = 0x22FF8C00;
		super.create();

		var gamepad = FlxG.gamepads.lastActive;
        
		_map = new FlxTilemap();
		_map.loadMapFromArray([
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
			1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
			1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
			1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
			1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
			1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
			1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
			1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
			1,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,1,
			1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
			1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,1,1,1,
			1,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,1,1,1,1,
			1,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
			20, 15, "assets/tiles.png", 16, 16);
		add(_map);

		
		_slime = new Slime(192, 128, gamepad);
		add(_slime);
		
		//_powerup = new FlxSprite(48, 208, "assets/powerup.png");
		//add(_powerup);

		var numGoo:Int = 8;
		playerGoo = new FlxTypedGroup<FlxSprite>(numGoo*8);

		//Rainbows in the Dark
		for (i in 0...numGoo)
		{
			sprite = new FlxSprite( -100, -100);
			sprite.makeGraphic(4, 2, FlxColor.RED);
			sprite.width = 10;
			sprite.height = 10;
			sprite.offset.set( -1, -8);
			sprite.exists = false;
			playerGoo.add(sprite);

			sprite = new FlxSprite( -100, -100);
			sprite.makeGraphic(4, 2, FlxColor.ORANGE);
			sprite.width = 10;
			sprite.height = 10;
			sprite.offset.set( -1, -8);
			sprite.exists = false;
			playerGoo.add(sprite);

			sprite = new FlxSprite( -100, -100);
			sprite.makeGraphic(4, 2, FlxColor.YELLOW);
			sprite.width = 10;
			sprite.height = 10;
			sprite.offset.set( -1, -8);
			sprite.exists = false;
			playerGoo.add(sprite);

			sprite = new FlxSprite( -100, -100);
			sprite.makeGraphic(4, 2, FlxColor.LIME);
			sprite.width = 10;
			sprite.height = 10;
			sprite.offset.set( -1, -8);
			sprite.exists = false;
			playerGoo.add(sprite);

			sprite = new FlxSprite( -100, -100);
			sprite.makeGraphic(4, 2, FlxColor.CYAN);
			sprite.width = 10;
			sprite.height = 10;
			sprite.offset.set( -1, -8);
			sprite.exists = false;
			playerGoo.add(sprite);

			sprite = new FlxSprite( -100, -100);
			sprite.makeGraphic(4, 2, FlxColor.BLUE);
			sprite.width = 10;
			sprite.height = 10;
			sprite.offset.set( -1, -8);
			sprite.exists = false;
			playerGoo.add(sprite);

			sprite = new FlxSprite( -100, -100);
			sprite.makeGraphic(4, 2, FlxColor.PURPLE);
			sprite.width = 10;
			sprite.height = 10;
			sprite.offset.set( -1, -8);
			sprite.exists = false;
			playerGoo.add(sprite);

			sprite = new FlxSprite( -100, -100);
			sprite.makeGraphic(4, 2, FlxColor.MAGENTA);
			sprite.width = 10;
			sprite.height = 10;
			sprite.offset.set( -1, -8);
			sprite.exists = false;
			playerGoo.add(sprite);

		}

		add(playerGoo);
		
		//_txtInfo = new FlxText(16, 16, -1, _info);
		//add(_txtInfo);
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);	
		FlxG.collide(_map, _slime);
		//FlxG.overlap(_slime, _powerup, getPowerup);
		
		//_txtInfo.text = _info.replace("{STATE}", Type.getClassName(_slime.fsm.stateClass));
		
		if (FlxG.keys.justReleased.R)
		{
			FlxG.camera.flash(FlxColor.BLACK, .1, FlxG.resetState);
		}
	}
	
	private function getPowerup(slime:Slime, particle:FlxSprite):Void
	{		
		slime.fsm.transitions.replace(Slime.Jump, Slime.SuperJump);
		slime.fsm.transitions.add(Slime.Jump, Slime.Idle, Slime.Conditions.grounded);
		
		particle.kill();
	}
}
