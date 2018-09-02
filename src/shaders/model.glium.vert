/*
* Vertex shader using an MVP matrix
* to calculate vertex positions.
* This is the default shader for all models.
*
* Because glium lacks support for proper uniforms,
* we need a separate shader to use glium.
*/
#version 450
#extension GL_ARB_separate_shader_objects : enable

layout (location = 0) in vec3 a_position;
layout (location = 1) in vec3 a_normal;

layout (location = 0) out vec3 v_position;
layout (location = 1) out vec3 v_normal;

uniform mat4 matrix;
uniform mat4 modelview; // TODO - this is redundant

void main() {
    gl_Position = matrix * vec4(a_position, 1.0);
    v_position = gl_Position.xyz / gl_Position.w;
    v_normal = transpose(inverse(mat3(modelview))) * a_normal;
}