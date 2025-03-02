shader_type canvas_item;

uniform float bounce_amount = 40.0;
uniform float bounce_time = 3.0;
uniform float beat_amount = 50.0;
uniform float beat_time = 5.0;

void vertex() {
	VERTEX.y = VERTEX.y - bounce_amount * abs(sin(bounce_time * TIME));
	if(VERTEX_ID == 0) {
		VERTEX.x = VERTEX.x + beat_amount - beat_amount * abs(sin(beat_time * TIME));
	}
}