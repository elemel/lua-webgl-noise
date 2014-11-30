float fbm(vec2 v, float octave, vec2 lacunarity, float gain) {
    int integralOctave = int(octave);
    float fractionalOctave = fract(octave);
    float amplitude = 1.0;

    float totalNoise = 0.0;
    float totalAmplitude = 0.0;

    for (int i = 0; i < integralOctave; ++i) {
        totalNoise += amplitude * snoise(v);
        totalAmplitude += amplitude;

        v *= lacunarity;
        amplitude *= gain;
    }

    if (fractionalOctave > 0.0) {
        totalNoise += fractionalOctave * amplitude * snoise(v);
        totalAmplitude += fractionalOctave * amplitude;
    }

    return totalNoise / totalAmplitude;
}

float fbm(vec2 v, float octave) {
    return fbm(v, octave, vec2(2.0), 0.5);
}

float fbm(vec2 v) {
    return fbm(v, 3.0);
}
