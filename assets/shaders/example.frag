#version 460 core

#include <flutter/runtime_effect.glsl>

uniform vec2 uResolution;
uniform float uPointerX;
uniform sampler2D uLogo;

out vec4 oColor;

vec4 getImage(vec2 uv, vec2 res) {
    vec2 imgSize = vec2(32.0, 32.0);

    int horCount = int(res.x / imgSize.x);
    int verCount = int(res.y / imgSize.y);
    int horShift = int(uv.x * horCount);
    int verShift = int(uv.y * verCount);

    uv.x *= horCount;
    uv.y *= verCount;

    uv.x -= horShift;
    uv.y -= verShift;

    return texture(uLogo, uv);
}
void main() {
    vec2 xy = FlutterFragCoord().xy;
    vec2 uv = xy / uResolution;

    oColor = getImage(uv, uResolution);

    float gradientKoef = 1.0 - abs(uPointerX - uv.x);

    oColor *= abs(uPointerX - 0.5);
    oColor *= gradientKoef;
    oColor *= 1.5;

    float diffSign = abs(uPointerX - 0.5) / (uPointerX - 0.5);

    oColor.r *= (-16 * (uPointerX - uv.x - diffSign * 0.2) * (uPointerX - uv.x - diffSign * 0.2) + 5) * gradientKoef;
    oColor.g *= (-8 * (uPointerX - uv.x - diffSign * 0.23) * (uPointerX - uv.x - diffSign * 0.23) + 3) * gradientKoef;
    oColor.b *= (16 * (uPointerX - uv.x - diffSign * 0.22) * (uPointerX - uv.x - diffSign * 0.22) + 5) * (1.0 - gradientKoef);
}
