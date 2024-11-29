// se for player1, os sprites são do goku
// senão se for player2, os sprites são do naruto
if (player_id == 0) {
	sprite_right = spr_player1_right;
	sprite_top = spr_player1_top;
	sprite_left = spr_player1_left;
	sprite_down = spr_player1_down;
}
else {	
	sprite_right = spr_player2_right;
	sprite_top = spr_player2_top;
	sprite_left = spr_player2_left;
	sprite_down = spr_player2_down;
}

var _input = rollback_get_input();
// 0 ou 1 - tecla não pressionada ou tecla pressionada
top = _input.top;
right = _input.right;
down = _input.down;
left = _input.left;


change_state();
movement(top, right, down, left);
change_sprite();