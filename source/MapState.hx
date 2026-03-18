import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class MapState extends FlxState
{
	public var map:FlxSprite = new FlxSprite(0, 0, 'assets/images/map.png');
	public var player:FlxSprite = new FlxSprite(0, 0, 'assets/images/player-map.png');

	override function create()
	{
		super.create();

		Global.scaleSprite(map);
		map.screenCenter();
		add(map);

		Global.scaleSprite(player);
		add(player);

		positionPlayer();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		#if debug
		if (FlxG.keys.justReleased.C)
		{
			Global.MAP_POSITION++;

            if (Global.MAP_POSITION.int() > MapPosition.EAST_TOP_CORNER_CLASSROOM.int())
                Global.MAP_POSITION = MapPosition.SOUTH_ENTRANCE;

            positionPlayer();
		}
		#end
	}

	public function positionPlayer()
	{
		player.screenCenter();
		switch (Global.MAP_POSITION)
		{
			case SOUTH_ENTRANCE:

			default:
		}
	}
}
