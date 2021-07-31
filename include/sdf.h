#ifndef _SDF_H_
#define _SDF_H_

#include <stdint.h>
#include <graphics.h>

enum sdf_font {
    SDF_FONT_THIN,
    SDF_FONT_BOLD,
    SDF_FONT_MONO,
    SDF_FONT_MONO_BOLD,
    SDF_FONT_MONO_OBLIQUE,
    SDF_FONT_MONO_BOLD_OBLIQUE,
    SDF_FONT_OBLIQUE,
    SDF_FONT_BOLD_OBLIQUE,
};

extern void init_sdf();
extern int draw_sdf_string(gfx_context_t * ctx, int32_t x, int32_t y, const char * str, int size, uint32_t color, int font);
extern int draw_sdf_string_width(const char * str, int size, int font);
extern int draw_sdf_string_gamma(gfx_context_t * ctx, int32_t x, int32_t y, const char * str, int size, uint32_t color, int font, double _gamma);
extern int draw_sdf_string_stroke(gfx_context_t * ctx, int32_t x, int32_t y, const char * str, int size, uint32_t color, int font, double _gamma, double stroke);

#endif /*_SDF_H_*/
