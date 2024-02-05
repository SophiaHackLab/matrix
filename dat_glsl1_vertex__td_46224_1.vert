uniform sampler2D sColors;
uniform float uRows;

out vec3 vUV;

void main() 
{
	vUV = uv[0];

	int row = TDInstanceID();
	vUV.y = row / uRows;
	float brightness = texture(sColors, vUV.st).r;
	vec4 pos = vec4(P, 1.0);
	pos.z = brightness * 50.0;
	vec4 worldSpacePos = TDDeform(pos);
	gl_Position = TDWorldToProj(worldSpacePos);
}


