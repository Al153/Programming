#version 130

in vec3 frag_normal;	// fragment normal in world space

out vec3 colour;

void main()
{
	const vec3 I_a = vec3(0.2, 0.2, 0.2);       // Ambient light intensity (and colour)

	const float k_d = 0.8;                      // Diffuse light factor
    vec3 C_diff = vec3(0.560, 0.525, 0.478);    // Diffuse light colour

	const vec3 I = vec3(0.941, 0.968, 1);   // Light intensity (and colour)
	vec3 L = normalize(vec3(2, 1.5, -0.5)); // The light direction as a unit vector
	vec3 N = frag_normal;                   // Normal in world coordinates

    // TODO: calculate reflected colour instead of abs(frag_nromal) below
    colour = abs(frag_normal);

}