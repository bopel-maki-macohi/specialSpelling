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

        #if MAP_DEBUG
		player.color = 0xFF0000;
        #end
		add(player);

		positionPlayer();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		FlxG.watch.addQuick('MAP_POSITION', Global.MAP_POSITION);

		#if MAP_DEBUG
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
		Global.scaleSprite(player, 2 - Global.SPRITE_SCALE);
		player.screenCenter();

		var vertical_bottom:Bool = false;
		var vertical_top:Bool = false;

		var vertical_south_hall:Bool = false;
		var vertical_top_class:Bool = false;

		var left_side:Bool = false;
		var right_side:Bool = false;

		switch (Global.MAP_POSITION)
		{
			case SOUTH_ENTRANCE:
				vertical_bottom = true;

			case WEST_BOTTOM_CORNER:
				vertical_bottom = true;
				left_side = true;

			case WEST_TOP_CORNER:
				vertical_top = true;
				left_side = true;

			case WEST_TOP_CORNER_CLASSROOM:
				vertical_top_class = true;
				left_side = true;

			case SOUTH_TOP_HALL_BOTTOMWEST:
				vertical_top = true;
				left_side = true;
				player.x += player.width * 3.5;

			case SOUTH_TOP_HALL_TOPWEST:
				vertical_top = true;
				left_side = true;
				player.x += player.width * 3.5;
				player.y -= player.height * 2.5;

			case SOUTH_TOP_HALL_CENTER:
				vertical_top = true;
				player.y -= player.height * 2.5;

			case SOUTH_TOP_HALL_TOPEAST:
				vertical_top = true;
				right_side = true;
				player.x -= player.width * 3.5;
				player.y -= player.height * 2.5;

			case SOUTH_TOP_HALL_BOTTOMEAST:
				vertical_top = true;
				right_side = true;
				player.x -= player.width * 3.5;

			case SOUTH_HALL:
				vertical_south_hall = true;

			case SOUTH_HALL_WEST_CLASSROOM:
				vertical_south_hall = true;
				player.x -= player.width * 3;

			case SOUTH_HALL_EAST_CLASSROOM:
				vertical_south_hall = true;
				player.x += player.width * 3;

			case WEST_CAFE:
				left_side = true;

			case EAST_CAFE:
				right_side = true;

			case EAST_BOTTOM_CORNER:
				vertical_bottom = true;
				right_side = true;

			case EAST_BOTTOM_CORNER_CLASSROOM:
				vertical_south_hall = true;
				right_side = true;
				player.y -= player.height * 0.5;

			case CENTER_CAFE_CLASSROOM:
				player.y -= player.height * 4;

			case EAST_TOP_CORNER:
				vertical_top = true;
				right_side = true;

			case EAST_TOP_CORNER_CLASSROOM:
				vertical_top_class = true;
				right_side = true;

            case CENTER_CAFE:
		}

		if (vertical_south_hall)
		{
			vertical_bottom = true;
			player.y -= player.height * 3;
		}

		if (vertical_top_class)
		{
			vertical_top = true;
			player.y -= player.height * 2.5;
		}

		if (vertical_bottom)
			player.y += player.height * 6;
		if (vertical_top)
			player.y -= player.height * 4;

		if (left_side)
			player.x -= player.width * 6;
		if (right_side)
			player.x += player.width * 6;
	}
}
