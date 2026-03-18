import flixel.FlxSprite;

class Global
{
	public static var MAP_POSITION:MapPosition = SOUTH_ENTRANCE;

	public static final SPELLINGS_TOTAL:Int = 6;
	public static var SPELLINGS_COMPLETED:Int = 0;

	public static final SPRITE_SCALE:Int = 8;

	public static function scaleSprite(sprite:FlxSprite, ?offset:Int = 0)
	{
		sprite.scale.set(SPRITE_SCALE + offset, SPRITE_SCALE + offset);
        sprite.updateHitbox();
	}
}
