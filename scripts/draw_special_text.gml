// BUTTERSCOTCH SHENANIGANS SPECIAL TEXT SCRIPT! 
// This GameMaker script will look into your character map and draw your fancy text.
// The text will be centered and top-oriented (additional lines will go below the first).
// You do not need to input a "width" when you call it, but if you do, it will start a new line
// if the displayed text exceeds that width. 
var xx = argument0, yy = argument1, // The position to draw the text.
        stringInput = argument2,
        xscale = argument3, 
        yscale = argument4,
        kerning = argument5, // Spacing between letters. Input 0 for default.
        colortint = argument6,
        width = argument7, // Maximum width of the text.
        xpos, textwidth = 0, curspr, vpos = 0;
for (i = 1; i <= string_length(stringInput); i += 1){
    curspr = ds_map_find_value(CHARMAP, string_lower(string_char_at(stringInput,i)))
    textwidth += sprite_get_width(curspr)*xscale+kerning*xscale
    if width
       textwidth = min(width,textwidth)
} 
xpos = xx - textwidth*.5; 
for (i = 1; i <= string_length(stringInput); i += 1){
    curspr = ds_map_find_value(CHARMAP, string_lower(string_char_at(stringInput,i)))
    if width && i != string_length(stringInput){
        if xpos > xx+width/2 && curspr == sp_space{
           vpos += 65*yscale
           var str_remaining, j, checkspr, newwidth = 0;
           str_remaining = string_delete(stringInput,1,i);
           for (j = 1; j <= string_length(str_remaining); j += 1){
                 checkspr = ds_map_find_value(CHARMAP, string_lower(string_char_at(stringInput,i)))
                 newwidth += sprite_get_width(checkspr)*xscale 
           }
           xpos = max(xx-newwidth*.5, xx-width*.5)
        }
     }
     xpos += .5*sprite_get_width(curspr)*xscale
     draw_sprite_ext(curspr,0,xpos,yy+vpos,xscale,yscale,0,colortint,1)
     xpos += .5*sprite_get_width(curspr)*xscale
     xpos += kerning*xscale
}
