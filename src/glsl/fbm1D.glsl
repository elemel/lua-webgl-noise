float fbm(float x, float octave, float lacunarity, float gain) {
    int integralOctave = int(octave);
    float fractionalOctave = fract(octave);
    float amplitude = 1.0;

    float totalNoise = 0.0;
    float totalAmplitude = 0.0;

    for (int i = 0; i < integralOctave; ++i) {
        totalNoise += amplitude * snoise(x);
        totalAmplitude += amplitude;

        x *= lacunarity;
        amplitude *= gain;
    }

    if (fractionalOctave > 0.0) {
        totalNoise += fractionalOctave * amplitude * snoise(x);
        totalAmplitude += fractionalOctave * amplitude;
    }

    return totalNoise / totalAmplitude;
}

float fbm(float x, float octave) {
    return fbm(x, octave, 2.0, 0.5);
}

float fbm(float x) {
    return fbm(x, 3.0);
}
