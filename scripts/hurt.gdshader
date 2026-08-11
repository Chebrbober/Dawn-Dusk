shader_type canvas_item;

uniform vec4 hit_color : source_color = vec4(1.0, 0.0, 0.0, 1.0);
uniform float hit_opacity : hint_range(0.0, 1.0) = 0.0;

void fragment() {
    vec4 tex_color = texture(TEXTURE, UV);
    // Mix the original texture color with the hit color based on hit_opacity
    vec3 final_color = mix(tex_color.rgb, hit_color.rgb, hit_opacity);
    COLOR = vec4(final_color, tex_color.a);
}
