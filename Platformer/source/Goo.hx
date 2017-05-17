package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.tile.FlxTilemap;
import flixel.group.FlxGroup;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author Mark Godsy
 */
class Goo extends FlxSprite 
{   
    private var h:Int = 0;
    private var w:Int = 0;

    public function new(?X:Float=0, ?Y:Float=0, ?color:FlxColor) 
	{
		super(X, Y);
        //Values for the height and width of the sprite
        h = 2;
        w = 4;
        
        // Initializes a basic graphic for the Trap using the h, and w values
         makeGraphic(w, h, color);

	}

   public function cleanUp(wall:FlxTilemap, goo:FlxSprite) {
        //goo.kill();
   }

    /**
	 * Update function.
	 * 
	 * Responsible for parsing input and handing those inputs off to whatever functions
	 * need them to operate correctly.
	 * 
	 * @param	elapsed	Time passed since last call to update in seconds.
	 */
	public override function update(elapsed:Float):Void
	{		
		//Check if bullet hit any object
        
		if (isTouching(FlxObject.ANY)) {
			kill();
		}
		super.update(elapsed);

	}


}