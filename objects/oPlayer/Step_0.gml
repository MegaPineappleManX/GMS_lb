// Input
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump_down = keyboard_check_pressed(vk_space);

// Horizontal Movement
var move = key_right - key_left;
horSpeed = move * moveSpeed;

// Vertical Movement
vertSpeed += grav;

if (place_meeting(x, y + 1, oWall) && key_jump_down) {
	vertSpeed = jumpSpeed;
}

// Horizontal Collision
if (place_meeting(x + horSpeed, y, oWall)) {
	while (!place_meeting(x + sign(horSpeed), y, oWall)) {
		x += sign(horSpeed);
	}
	horSpeed = 0;
} else {
	x += horSpeed;
}

// Vertical Collision
if (place_meeting(x, y + vertSpeed, oWall)) {
	while (!place_meeting(x, y + sign(vertSpeed), oWall)) {
		y += sign(vertSpeed);
	}
	vertSpeed = 0;
} else {
	y += vertSpeed;
}

// Animation
if (!place_meeting(x, y + 1, oWall)) {
	sprite_index = sPlayerAir;
	image_speed = 0;
	
	if (sign(vertSpeed) > 0) {
		image_index = 1;	
	} else {
		image_index = 0;
	}
} else if (horSpeed == 0) {
	image_speed = 0;
	sprite_index = sPlayerIdle;	
} else if (horSpeed != 0) {
	image_speed = 1;
	sprite_index = sPlayerRun;	
}

if (sign(horSpeed) < 0) {
	image_xscale = -1;	
} else if (sign(horSpeed) > 0) {
	image_xscale = 1;
}