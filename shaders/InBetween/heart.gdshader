shader_type canvas_item;

uniform float bounce_amount = 40.0;
uniform float bounce_time = 3.0;

void vertex() {
	VERTEX.y = VERTEX.y + bounce_amount * sin(bounce_time * TIME);
}

//void fragment() {
	// Called for every pixel the material is visible on.
//}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
