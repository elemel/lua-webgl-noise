// Adapted from:
//
// - http://staffwww.itn.liu.se/~stegu/aqsis/aqsis-newnoise/simplexnoise1234.cpp
// - https://github.com/ashima/webgl-noise

float mod289(float x) {
    return x - floor(x * (1.0 / 289.0)) * 289.0;
}

vec2 mod289(vec2 v) {
    return v - floor(v * (1.0 / 289.0)) * 289.0;
}

vec2 permute(vec2 v) {
    return mod289(((v * 34.0) + 1.0) * v);
}

vec2 grad(vec2 i, vec2 f) {
    // Map to integer gradient in [-8, -1] or [1, 8].
    vec2 c = 2.0 * fract(i * (1.0 / 16.0)) - 1.0;
    vec2 g = 1.0 + 8.0 * c + floor(c);

    // Multiply gradient by distance.
    return g * f;
}

float snoise(float x) {
    float ix = floor(x);
    float fx = x - ix;

    vec2 i = vec2(ix, ix + 1.0);
    vec2 f = vec2(fx, fx - 1.0);

    vec2 t = 1.0 - f * f;

    vec2 p = permute(mod289(i));
    vec2 n = t * t * t * t * grad(p, f);

    // Normalize noise to [-1, 1].
    return (n.x + n.y) * (1.0 / 2.53125);
}
