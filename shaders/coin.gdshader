shader_type canvas_item;

uniform float float_amount = 10.0;
uniform float float_time = 3.0;

void vertex() {
	VERTEX.y = VERTEX.y - float_amount * sin(float_time * TIME);
}
