shader_type canvas_item;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture;

void fragment() {
    // Coordenadas atuais da tela
    vec2 screen_uv = SCREEN_UV;

    // Cor da tela no ponto atual
    vec4 screen_color = texture(SCREEN_TEXTURE, screen_uv);

    // Converter para escala de cinza (luminosidade perceptual)
    float gray = dot(screen_color.rgb, vec3(0.299, 0.587, 0.114));

    // Aplica o preto e branco atrás do objeto
    COLOR = vec4(vec3(gray), screen_color.a);
}
