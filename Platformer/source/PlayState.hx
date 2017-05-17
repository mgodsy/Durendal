package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxObject;
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
	private var goo:Goo;
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
			goo = new Goo( -100, -100, FlxColor.RED);
			goo.exists = false;
			playerGoo.add(goo);

			goo = new Goo( -100, -100, FlxColor.ORANGE);
			
			goo.exists = false;
			playerGoo.add(goo);

			goo = new Goo( -100, -100, FlxColor.YELLOW);
			
			goo.exists = false;
			playerGoo.add(goo);

			goo = new Goo( -100, -100, FlxColor.LIME);
			
			goo.exists = false;
			playerGoo.add(goo);

			goo = new Goo( -100, -100, FlxColor.CYAN);
			
			goo.exists = false;
			playerGoo.add(goo);

			goo = new Goo( -100, -100, FlxColor.BLUE);
			
			goo.exists = false;
			playerGoo.add(goo);

			goo = new Goo( -100, -100, FlxColor.PURPLE);
			
			goo.exists = false;
			playerGoo.add(goo);

			goo = new Goo( -100, -100, FlxColor.MAGENTA);
			
			goo.exists = false;
			playerGoo.add(goo);

		}

		add(playerGoo);
		
		//_txtInfo = new FlxText(16, 16, -1, _info);
		//add(_txtInfo);
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);	
		FlxG.collide(_map, _slime);
		FlxG.collide(_map, playerGoo);
		//FlxG.collide(playerGoo, playerGoo);

		//FlxG.overlap(_map, playerGoo, goo.cleanUp);
		// FlxG.overlap(_slime, _powerup, getPowerup);
		
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
