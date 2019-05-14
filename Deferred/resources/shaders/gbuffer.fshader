#version 330

in vec2 fragUV;
in vec3 fragNormal;
in vec3 fragPosition;

uniform sampler2D textureData;
uniform sampler2D materialMap;
uniform int haveMaterialMap;

out vec4 gDiffuse;
out vec4 gNormal;
out vec4 gPosition;
out vec4 gMaterial;

vec2 sphereMap(vec3 nor) {
	return normalize(nor.xy) * sqrt(-nor.z*0.5 + 0.5) * 0.5 + 0.5;
}

void main() {

	gDiffuse = vec4(texture(textureData, fragUV).rgb, 1.0);
	gNormal = vec4(fragNormal, 1.0);
	gPosition = vec4(fragPosition, 1.0);

	if (haveMaterialMap == 1) {
		gMaterial = vec4(texture(materialMap, fragUV).rgb, 1.0);
	} else {
		gMaterial = vec4(vec3(0.0), 1.0);
	}
}
