shader_type canvas_item;

const float speed = 0.5;

void fragment() {
	// Called for every pixel the material is visible on.
	vec2 new_uv = vec2(UV.x - TIME * speed, UV.y);
	COLOR = texture(TEXTURE,new_uv);
}
