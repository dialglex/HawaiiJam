shader_type canvas_item;
render_mode unshaded;

uniform sampler2D sampler;
uniform float alpha: hint_range(0.0, 1.0);

void fragment() {
	float r = texture(TEXTURE, UV).r;
	COLOR = vec4(texture(sampler, vec2(r, 0.5)).rgb, alpha);
}
