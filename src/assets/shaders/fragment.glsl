#include <fog_pars_fragment>
uniform vec3 uValleyColor;
uniform vec3 uPeakColor;
uniform float uColorOffset;
uniform float uColorMultiplier;

varying float vRandom;
varying vec2 vUv;
varying float vElevation;



void main() {
   float mixStrength = (vElevation + uColorOffset) * uColorMultiplier;
   vec3 color = mix(uValleyColor, uPeakColor, mixStrength);
   gl_FragColor = vec4(color, 1.0);
   #include <fog_fragment>
}