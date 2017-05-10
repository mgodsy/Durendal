package;

import flixel.addons.util.FlxFSM;
import flixel.input.gamepad.FlxGamepad;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.util.FlxColor;


class Slime extends FlxSprite
{
	public static inline var GRAVITY:Float = 600;
	
	public var fsm:FlxFSM<FlxSprite>;
	public var gp:FlxGamepad;
	
	public function new(X:Float = 0, Y:Float = 0, gamepad)
	{
		super(X, Y);
		
		gp = gamepad;
		
		Conditions.setGamepad(gp);

		loadGraphic("assets/slime.png", true, 16, 16);
		setFacingFlip(FlxObject.LEFT, true, false);
		setFacingFlip(FlxObject.RIGHT, false, false);
		facing = FlxObject.RIGHT;
		
		animation.add("standing", [0, 1], 3);
		animation.add("walking", [0, 1], 12);
		animation.add("jumping", [2]);
		animation.add("pound", [3]);
		animation.add("landing", [4, 0, 1, 0], 8, false);
		
		acceleration.y = GRAVITY;
		maxVelocity.set(100, GRAVITY);
		
		fsm = new FlxFSM<FlxSprite>(this);
		fsm.transitions
			.add(Idle, Jump, Conditions.jump)
			.add(Jump, Idle, Conditions.grounded)
			.add(Jump, GroundPound, Conditions.groundSlam)
			.add(Jump, DoubleJump, Conditions.doubleJump)
			.add(DoubleJump, Idle, Conditions.grounded)
			.add(DoubleJump, GroundPound, Conditions.groundSlam)
			//.add(DoubleJump, TripleJump, Conditions.doubleJump)
			//.add(TripleJump, Idle, Conditions.grounded)
			//.add(TripleJump, GroundPound, Conditions.groundSlam)
			//.add(TripleJump, DoubleJump, Conditions.doubleJump)
			.add(GroundPound, GroundPoundFinish, Conditions.grounded)
			.add(GroundPoundFinish, Idle, Conditions.animationFinished)
			.start(Idle);
	}
	
	override public function update(elapsed:Float):Void 
	{
		fsm.update(elapsed);
		super.update(elapsed);
	}
	
	override public function destroy():Void 
	{
		fsm.destroy();
		fsm = null;
		super.destroy();
	}
}

class Conditions 
{
	private static var gp:FlxGamepad;

	public static function setGamepad(gamepad:FlxGamepad){
		gp = gamepad;
	}
       
	public static function jump(Owner:FlxSprite):Bool
	{
		return ( (FlxG.keys.justPressed.UP || gp.justPressed.A) && Owner.isTouching(FlxObject.DOWN));
	}

	public static function fire(Owner:FlxSprite):Bool
	{
		return (FlxG.keys.justPressed.SPACE && Owner.isTouching(FlxObject.DOWN));
	}

	public static function doubleJump(Owner:FlxSprite):Bool
	{
		return ((FlxG.keys.justPressed.UP || gp.justPressed.A) && !Owner.isTouching(FlxObject.DOWN));
	}
	
	public static function grounded(Owner:FlxSprite):Bool
	{
		return Owner.isTouching(FlxObject.DOWN);
	}
	
	public static function groundSlam(Owner:FlxSprite)
	{
		return ((FlxG.keys.justPressed.DOWN || gp.pressed.B) && !Owner.isTouching(FlxObject.DOWN));
	}
	
	public static function animationFinished(Owner:FlxSprite):Bool
	{
		return Owner.animation.finished;
	}
}

class Idle extends FlxFSMState<FlxSprite>
{
	var gp:FlxGamepad = FlxG.gamepads.lastActive;

	override public function enter(owner:FlxSprite, fsm:FlxFSM<FlxSprite>):Void 
	{
		owner.animation.play("standing");
	}
	
	override public function update(elapsed:Float, owner:FlxSprite, fsm:FlxFSM<FlxSprite>):Void 
	{
		owner.acceleration.x = 0;
		if (FlxG.keys.pressed.LEFT || FlxG.keys.pressed.RIGHT)
		{
			owner.facing = (FlxG.keys.pressed.LEFT) ? FlxObject.LEFT : FlxObject.RIGHT;
			owner.animation.play("walking");
			owner.acceleration.x = FlxG.keys.pressed.LEFT ? -300 : 300;
		}
		else if(gp.pressed.DPAD_LEFT || gp.pressed.DPAD_RIGHT){
			owner.facing = (gp.pressed.DPAD_LEFT) ? FlxObject.LEFT : FlxObject.RIGHT;
			owner.animation.play("walking");
			owner.acceleration.x = gp.pressed.DPAD_LEFT ? -300 : 300;
		}
		else
		{
			owner.animation.play("standing");
			owner.velocity.x *= 0.9;
		}
	}
}

class Jump extends FlxFSMState<FlxSprite>
{
	var gp:FlxGamepad = FlxG.gamepads.lastActive;
	
	override public function enter(owner:FlxSprite, fsm:FlxFSM<FlxSprite>):Void 
	{
		owner.animation.play("jumping");
		owner.velocity.y = -200;
	}
	
	override public function update(elapsed:Float, owner:FlxSprite, fsm:FlxFSM<FlxSprite>):Void 
	{
		owner.acceleration.x = 0;
		if (FlxG.keys.pressed.LEFT || FlxG.keys.pressed.RIGHT)
		{
			owner.facing = (FlxG.keys.pressed.LEFT) ? FlxObject.LEFT : FlxObject.RIGHT;
			owner.animation.play("jumping");
			owner.acceleration.x = FlxG.keys.pressed.LEFT ? -300 : 300;
		}
		else if(gp.pressed.DPAD_LEFT || gp.pressed.DPAD_RIGHT){
			owner.facing = (gp.pressed.DPAD_LEFT) ? FlxObject.LEFT : FlxObject.RIGHT;
			owner.animation.play("jumping");
			owner.acceleration.x = gp.pressed.DPAD_LEFT ? -300 : 300;
		}
	}
}

class DoubleJump extends FlxFSMState<FlxSprite>
{
	var gp:FlxGamepad = FlxG.gamepads.lastActive;
	private var _ticks:Float;

	override public function enter(owner:FlxSprite, fsm:FlxFSM<FlxSprite>):Void 
	{
		owner.animation.play("standing");
		owner.velocity.x = 0;
		owner.acceleration.x = 0;
		_ticks = 0;
		//owner.velocity.y = -200;
	}
	
	override public function update(elapsed:Float, owner:FlxSprite, fsm:FlxFSM<FlxSprite>):Void 
	{
		_ticks++;
		if (_ticks < 15)
		{
			owner.velocity.y = 0;
		}
		else if(_ticks == 15){
			owner.animation.play("jumping");
			owner.velocity.y = -200;
		}
		else
		{	
			owner.acceleration.x = 0;
			if (FlxG.keys.pressed.LEFT || FlxG.keys.pressed.RIGHT)
			{
			owner.facing = (FlxG.keys.pressed.LEFT) ? FlxObject.LEFT : FlxObject.RIGHT;
			owner.animation.play("jumping");
			owner.acceleration.x = FlxG.keys.pressed.LEFT ? -300 : 300;
			}
			else if(gp.pressed.DPAD_LEFT || gp.pressed.DPAD_RIGHT){
				owner.facing = (gp.pressed.DPAD_LEFT) ? FlxObject.LEFT : FlxObject.RIGHT;
				owner.animation.play("jumping");
				owner.acceleration.x = gp.pressed.DPAD_LEFT ? -300 : 300;
		}
		}
	}
}

class TripleJump extends FlxFSMState<FlxSprite>
{
	var gp:FlxGamepad = FlxG.gamepads.lastActive;
	private var _ticks:Float;

	override public function enter(owner:FlxSprite, fsm:FlxFSM<FlxSprite>):Void 
	{
		owner.animation.play("standing");
		owner.velocity.x = 0;
		owner.acceleration.x = 0;
		_ticks = 0;
		//owner.velocity.y = -200;
	}
	
	override public function update(elapsed:Float, owner:FlxSprite, fsm:FlxFSM<FlxSprite>):Void 
	{
		_ticks++;
		if (_ticks < 15)
		{
			owner.velocity.y = 0;
		}
		else if(_ticks == 15){
			owner.animation.play("jumping");
			owner.velocity.y = -200;
		}
		else
		{	
			owner.acceleration.x = 0;
			if (FlxG.keys.pressed.LEFT || FlxG.keys.pressed.RIGHT)
			{
			owner.facing = (FlxG.keys.pressed.LEFT) ? FlxObject.LEFT : FlxObject.RIGHT;
			owner.animation.play("jumping");
			owner.acceleration.x = FlxG.keys.pressed.LEFT ? -300 : 300;
			}
			//else if(gp.pressed.DPAD_LEFT || gp.pressed.DPAD_RIGHT){
			//	owner.facing = (FlxG.keys.pressed.LEFT) ? FlxObject.LEFT : FlxObject.RIGHT;
			//	owner.animation.play("jumping");
			//	owner.acceleration.x = FlxG.keys.pressed.LEFT ? -300 : 300;
		//}
		}
	}
}

class SuperJump extends Jump
{
	override public function enter(owner:FlxSprite, fsm:FlxFSM<FlxSprite>):Void 
	{
		owner.animation.play("jumping");
		owner.velocity.y = -300;
	}
}

class Fire extends FlxFSMState<FlxSprite>
{
	override public function enter(owner:FlxSprite, fsm:FlxFSM<FlxSprite>):Void 
	{
		//shoot goes here
	}
}

class GroundPound extends FlxFSMState<FlxSprite>
{
	private var _ticks:Float;
	
	override public function enter(owner:FlxSprite, fsm:FlxFSM<FlxSprite>):Void 
	{
		owner.animation.play("pound");
		owner.velocity.x = 0;
		owner.acceleration.x = 0;
		_ticks = 0;
	}
	
	override public function update(elapsed:Float, owner:FlxSprite, fsm:FlxFSM<FlxSprite>):Void 
	{
		_ticks++;
		if (_ticks < 15)
		{
			owner.velocity.y = 0;
		}
		else
		{
			owner.velocity.y = Slime.GRAVITY;
		}
	}
}

class GroundPoundFinish extends FlxFSMState<FlxSprite>
{
	override public function enter(owner:FlxSprite, fsm:FlxFSM<FlxSprite>):Void 
	{
		owner.animation.play("landing");
		FlxG.camera.shake(0.025, 0.25);
		owner.velocity.x = 0;
		owner.acceleration.x = 0;
	}
}