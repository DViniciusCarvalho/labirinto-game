var _new_light_coef = light_coef + 0.15;

if (_new_light_coef > 2) {
	light_coef = 2;
}
else {
	light_coef = _new_light_coef;
}

instance_destroy(other);