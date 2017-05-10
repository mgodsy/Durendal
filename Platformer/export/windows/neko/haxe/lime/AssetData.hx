package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
			type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/Brick.png", "assets/images/Brick.png");
			type.set ("assets/images/Brick.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/bricks.png", "assets/images/bricks.png");
			type.set ("assets/images/bricks.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/bullet.png", "assets/images/bullet.png");
			type.set ("assets/images/bullet.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/cannon-ball-dark.png", "assets/images/cannon-ball-dark.png");
			type.set ("assets/images/cannon-ball-dark.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/cannon-ball.png", "assets/images/cannon-ball.png");
			type.set ("assets/images/cannon-ball.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/coinIcon.png", "assets/images/coinIcon.png");
			type.set ("assets/images/coinIcon.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/DontTouchMe.png", "assets/images/DontTouchMe.png");
			type.set ("assets/images/DontTouchMe.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Empty.png", "assets/images/Empty.png");
			type.set ("assets/images/Empty.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
			type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/Item.png", "assets/images/Item.png");
			type.set ("assets/images/Item.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Sentry.png", "assets/images/Sentry.png");
			type.set ("assets/images/Sentry.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tiles.png", "assets/images/tiles.png");
			type.set ("assets/images/tiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/powerup.png", "assets/powerup.png");
			type.set ("assets/powerup.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/slime.png", "assets/slime.png");
			type.set ("assets/slime.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/step.wav", "assets/sounds/step.wav");
			type.set ("assets/sounds/step.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/win.wav", "assets/sounds/win.wav");
			type.set ("assets/sounds/win.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/spit.png", "assets/spit.png");
			type.set ("assets/spit.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/tiles.png", "assets/tiles.png");
			type.set ("assets/tiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/tiles_2.png", "assets/tiles_2.png");
			type.set ("assets/tiles_2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/sounds/beep.ogg", "flixel/sounds/beep.ogg");
			type.set ("flixel/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/flixel.ogg", "flixel/sounds/flixel.ogg");
			type.set ("flixel/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/fonts/nokiafc22.ttf", "flixel/fonts/nokiafc22.ttf");
			type.set ("flixel/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/fonts/monsterrat.ttf", "flixel/fonts/monsterrat.ttf");
			type.set ("flixel/fonts/monsterrat.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/images/ui/button.png", "flixel/images/ui/button.png");
			type.set ("flixel/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/images/logo/default.png", "flixel/images/logo/default.png");
			type.set ("flixel/images/logo/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
