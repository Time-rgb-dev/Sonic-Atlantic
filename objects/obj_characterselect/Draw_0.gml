/// @description Draw the stuffs

draw_set_color(c_white);

var middlex = WINDOW_WIDTH / 2;
var middley = WINDOW_HEIGHT / 2;

draw_set_font(global.text_random);
draw_text(middlex - 5, camera_get_view_y(view_camera[0]) + 24, "CHARACTER_SELECT");

// Carousel geometry
var RadiusX = 160;
var RadiusY = 48;
var AngleStep = (pi * 2) / char_count;
var AngleOffset = scroll_offset / option_spacing * AngleStep;

// wheel effect
for (var i = 0; i < char_count; i++) {
    var RawAngle = (i * AngleStep) - AngleOffset;

    var Angle = degtorad(angle_difference(radtodeg(RawAngle), 0));

    var PosX = middlex + RadiusX * sin(Angle);
    var PosY = middley + RadiusY * cos(Angle);

    var DepthFactor = (1 + cos(Angle)) * 0.5;
    var Scale = 1 + DepthFactor * 0.5;
    var Alpha = 0.3 + (1 - abs(Angle)) * 0.7;
    Alpha = clamp(Alpha, 0.3, 1);

    var Selected = (abs(Angle) < 0.2);

    if (Selected && confirm_timer > 0) {
        Alpha *= confirm_alpha;
        Scale *= confirm_scale;
    }

    draw_sprite_ext(spr_characterselect_options, i, PosX, PosY, Scale, Scale, 0, c_white, Alpha);

// draw name
    if (Selected) {
        draw_set_font(global.text_random);
        draw_text(PosX, PosY + 80, char_names[i]);
    }
}
draw_set_valign(fa_middle);

