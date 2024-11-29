// variáveis de controle de movimento do player
dir = 0;
previous_dir = 0;
player_speed = 2;

// variáveis de controle de pressionamento de teclas de movimento
top = 0;
right = 0;
down = 0;
left = 0;

// variáveis de posição inicial
initial_player1_x = 335;
initial_player2_x = 889;
initial_players_y = (room_height / 2) + 10;

// variável de controle do estado de movimento do player
state = "stopped";

// sprites iniciais de todos os obj_player
sprite_right = spr_player1_right;
sprite_top = spr_player1_top;
sprite_left = spr_player1_left;
sprite_down = spr_player1_down;

light_coef = 1;


// envia cada player pra sua respectiva posição inicial
if (player_id == 0) {
	x = initial_player1_x;
	y = initial_players_y;
}
else {
	x = initial_player2_x;
	y = initial_players_y;
}


// controla o movimento e colisão dos players com paredes nos eixos x e y
movement = function(_top, _right, _down, _left) {
	// armazenam 0 ou 1:
	// se _xinput for 0 quer dizer que não há movimento no eixo x
	// se _xinput for 1 quer dizer que há movimento no eixo x
	// mesma coisa com _yinput, só que no eixo y
	var _xinput = _right - _left;
	var _yinput = _down - _top;
	
	// armazena o ângulo da direção que o player está andando
	var _dir = point_direction(0, 0, _xinput, _yinput);
	
	// faz o player andar o valor de player_speed em pixels no eixo x caso:
	// _xinput seja 1, ou seja, que haja movimento no eixo x
	// mesma coisa com y
	// caso haja uma colisão com algum obj_wall em qualquer eixo,
	// o player é bloqueado pelo obj_wall e não anda mais na direção dele
	// além disso, a velocidade do player é limitada a player_speed em todos os eixos
	move_and_collide(_xinput * player_speed, _yinput * player_speed, obj_wall, 4, 0, 0, player_speed, player_speed);
}


// muda os sprites do player de acordo com a direção para qual ele está andando
change_sprite = function() {
	// caso alguma tecla esteja sendo pressionada, sem outra tecla contrária,
	// dir recebe o ângulo para o qual o player está virado, em graus
	if (right xor left or down xor top) {
		dir = point_direction(0, 0, right - left, down - top);
    }
	
	// previous_dir armazena o valor do último ângulo olhado
	previous_dir = dir;
      
	// muda o sprite do player com base no angulo que ele tá virado
	// sentido considerado = antihorário
	switch(previous_dir) {
		case 0: sprite_index = sprite_right; break;
		case 90: sprite_index = sprite_top; break;
		case 180: sprite_index = sprite_left; break;
		case 270: sprite_index = sprite_down; break;
	}
}


// muda o estado de movimento do player para:
// stopped (parado) ou moving (movendo)
change_state = function() {
    switch(state) {
        case "stopped": {
			// caso esteja parado, a imagem não tem animação
            image_speed = 0;
            
			// caso ele tenha pressionado alguma tecla de movimento,
			// muda o estado pra "moving"
            if (right xor left or down xor top) {
                state = "moving";
            }
            
            break;
        }
        case "moving": {     
			// dir recebe o último ângulo para qual o player andou (previous_dir)
			dir = previous_dir;
			
			// caso esteja se movendo, a imagem tem animação
            image_speed = 1;
			
			// caso ele não tenha andado em nenhuma direção,
            // muda o estado pra "stopped"
            if (!right and !left and !down and !top) {
                state = "stopped";
				// muda o sprite do player para o último ângulo que o player andou antes de parar
				change_sprite();
            }
            
            break;
        }
    }
}