shader_type canvas_item;
uniform float r: hint_range(0.0, 1.0, 0.01);
uniform float g: hint_range(0.0,1.0,0.01);
uniform float b: hint_range(0.0,1.0,0.01);

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	COLOR = vec4(r,g,b,1.0);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
