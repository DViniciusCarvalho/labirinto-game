// criação de jogo multiplayer e
// definição do objeto que será usado pra ser player

if (!rollback_game_running && room == rm_room_1)
{
		//instance_deactivate_all(true);
		
        var _join = rollback_join_game();

        if (!_join) rollback_create_game(2, false);
}

if (rollback_join_game(true))
{
        room_goto(rm_room_1);
}