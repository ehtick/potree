#include <potree/WebGL2_pars_vertex>
#include <common>
#include <logdepthbuf_pars_vertex>

// #extension GL_EXT_frag_depth : enable

precision mediump float;
precision mediump int;

attribute vec3 position;
attribute vec2 uv;

uniform mat4 projectionMatrix;
uniform mat4 modelViewMatrix;

varying vec2 vUv;

void main() {
	vUv = uv;
	
	vec4 mvPosition = modelViewMatrix * vec4(position,1.0);

	gl_Position = projectionMatrix * mvPosition;

	#include <logdepthbuf_vertex>
}