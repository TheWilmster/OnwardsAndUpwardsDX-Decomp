//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	vec4 col = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	col.a /= 2.;
	gl_FragColor = col;
}