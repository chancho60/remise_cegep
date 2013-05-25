note
	description: "W50 cents (Wrappeur)"
	author: "Anthony et Étienne"
	date: "28 mars 2013"
	revision: "Alpha 3.2"

class
	SDL_WRAPPER

feature -- Functions -

	frozen SDL_Init (flags: NATURAL_32): INTEGER
			-- Cree un nouveau systeme de decompression JPEG avec `flags'.
			--int SDL_Init(Uint32 flags);
		external
			"C (Uint32) : int | <SDL.h>"
		alias
			"SDL_Init"
		end
	frozen SDL_LoadIMG (file: POINTER): POINTER
			-- Cree un nouveau systeme de decompression JPEG avec `flags'.
			--SDL_Surface *SDL_LoadBMP(const char *file);
		external
			"C (const char *) : struct SDL_Surface *| <SDL_image.h>"
		alias
			"IMG_Load"
		end

	frozen SDL_SetVideoMode (width, height, bitsperpixel:INTEGER; flags:NATURAL_32):POINTER
			-- Cree un nouveau systeme de decompression JPEG avec `flags'.
			--SDL_Surface* SDL_SetVideoMode(int width, int height, int bitsperpixel, Uint32 flags);
		external
			"C (int, int, int, Uint32):struct SDL_Surface * | <SDL.h>"
		alias
			"SDL_SetVideoMode"
		end

	frozen SDL_BlitSurface (src, srcrect, dst, dstrect: POINTER):INTEGER
			-- Cree un nouveau systeme de decompression JPEG avec `flags'.
			--SDL_Surface* SDL_SetVideoMode(int width, int height, int bitsperpixel, Uint32 flags);
		external
			"C (struct SDL_Surface *, struct SDL_Rect *, struct SDL_Surface *, struct SDL_Rect *) : int | <SDL.h>"
		alias
			"SDL_BlitSurface"
		end

	frozen SDL_Flip (screen: POINTER):INTEGER
			-- Cree un nouveau systeme de decompression JPEG avec `flags'.
			--SDL_Surface* SDL_SetVideoMode(int width, int height, int bitsperpixel, Uint32 flags);
		external
			"C (SDL_Surface *) : int | <SDL.h>"
		alias
			"SDL_Flip"
		end

	frozen SDL_Delay (ms: NATURAL_32)
			-- Cree un nouveau systeme de decompression JPEG avec `flags'.
			--SDL_Surface* SDL_SetVideoMode(int width, int height, int bitsperpixel, Uint32 flags);
		external
			"C (Uint32)| <SDL.h>"
		alias
			"SDL_Delay"
		end

	frozen SDL_PollEvent (event: POINTER):INTEGER
			-- Cree un nouveau systeme de decompression JPEG avec `flags'.
			--SDL_Surface* SDL_SetVideoMode(int width, int height, int bitsperpixel, Uint32 flags);
		external
			"C (SDL_Event *) : int| <SDL.h>"
		alias
			"SDL_PollEvent"
		end
	frozen SDL_QuitEvent (event: POINTER):INTEGER
			-- Cree un nouveau systeme de decompression JPEG avec `flags'.
			--SDL_Surface* SDL_SetVideoMode(int width, int height, int bitsperpixel, Uint32 flags);
		external
			"C (SDL_Event *) : int| <SDL.h>"
		alias
			"SDL_PollEvent"
		end
feature -- Structure Setter

	frozen set_SDL_target_area_H (SDL_Rect: POINTER; value: INTEGER)
			-- Modifie le champ h de la structure `SDL_Surface' par la valeur `h'.
		external
			"C [struct <SDL.h>] (struct SDL_Rect, Uint16)"
		alias
			"h"
	end

	frozen set_SDL_target_area_W (SDL_Rect: POINTER; value: INTEGER)
			-- Modifie le champ w de la structure `SDL_Surface' par la valeur `w'.
		external
			"C [struct <SDL.h>] (struct SDL_Rect, Uint16)"
		alias
			"w"
	end

	frozen set_SDL_target_area_X (SDL_Rect: POINTER; value: INTEGER_16)
			-- Modifie le champ h de la structure `SDL_Surface' par la valeur `x'.
		external
			"C [struct <SDL.h>] (struct SDL_Rect, Sint16)"
		alias
			"x"
	end

	frozen set_SDL_target_area_Y (SDL_Rect: POINTER; value: INTEGER_16)
			-- Modifie le champ w de la structure `SDL_Surface' par la valeur `y'.
		external
			"C [struct <SDL.h>] (struct SDL_Rect, Sint16)"
		alias
			"y"
	end

 feature -- Structure Getter

	frozen get_bmp_h (SDL_Surface:POINTER):INTEGER
			-- Le champ h de la structure `SDL_Surface'
		external
			"C [struct <SDL.h>] (struct SDL_Surface): int"
		alias
			"h"
		end
	frozen get_bmp_w (SDL_Surface:POINTER):INTEGER
			-- Le champ w de la structure `SDL_Surface'
		external
			"C [struct <SDL.h>] (struct SDL_Surface): int"
		alias
			"w"
		end
	frozen get_SDL_EventType (SDL_Event:POINTER):NATURAL_8

		external
			"C [struct <SDL.h>] (SDL_Event): Uint8"
		alias
			"type"
		end

	frozen get_SDL_EventKey (event:POINTER):POINTER

		external
			"C inline use <SDL.h>"
		alias
			"(SDL_KeyboardEvent *)(&(((SDL_Event *)$event)->key))"
		end

	frozen get_SDL_keysym (event:POINTER):POINTER

		external
			"C inline use <SDL.h>"
		alias
			"(SDL_keysym *)(&(((SDL_KeyboardEvent *)$event)->keysym))"
		end

	frozen get_SDL_sym (SDL_keysym:POINTER):NATURAL_8

		external
			"C [struct <SDL.h>] (SDL_keysym): Uint8"
		alias
			"sym"
		end

	frozen SDL_GetKeyName (sym:INTEGER):POINTER
			-- Modifie le champ h de la structure `SDL_Surface' par la valeur `h'.
		external
			"C (SDLKey):char * | <SDL.h>"
		alias
			"SDL_GetKeyName"
	end

feature --constante

	frozen SDL_INIT_VIDEO:NATURAL_32
		external
			"C inline use <SDL.h>"
		alias
			"SDL_INIT_VIDEO"
		end

	frozen SDL_SWSURFACE:NATURAL_32
		external
			"C inline use <SDL.h>"
		alias
			"SDL_SWSURFACE"
		end

	frozen SDL_QUIT:NATURAL_8
		external
			"C inline use <SDL.h>"
		alias
			"SDL_QUIT"
		end

	frozen SDL_KEYDOWN:NATURAL_8
		external
			"C inline use <SDL.h>"
		alias
			"SDL_KEYDOWN"
		end
	frozen SDL_KEYUP:NATURAL_8
		external
			"C inline use <SDL.h>"
		alias
			"SDL_KEYUP"
		end

	frozen SDLK_UP:NATURAL_8
		external
			"C inline use <SDL_keysym.h>"
		alias
			"SDLK_UP"
		end
	frozen SDLK_DOWN:NATURAL_8
		external
			"C inline use <SDL.h>"
		alias
			"SDLK_DOWN"
		end
	frozen SDLK_p:NATURAL_8
		external
			"C inline use <SDL.h>"
		alias
			"SDLK_p"
		end

	frozen Audio_format:NATURAL_8
		external
			"C inline use <SDL.h>"
		alias
			"AUDIO_S16SYS"
		end
feature --TTF WRAPPER
	frozen TTF_QUIT
		external
			"C inline use <SDL_ttf.h>"
		alias
			"TTF_Quit"
		end

	frozen TTF_CloseFont(font:POINTER)
		external
			"C inline use <SDL_ttf.h>"
		alias
			"TTF_CloseFont"
		end

	frozen TTF_INIT:INTEGER
		external
			"C:int | <SDL_ttf.h>"
		alias
			"TTF_Init"
		end

	frozen TTF_OpenFont(file:POINTER; ptsize:INTEGER):POINTER
		external
			"C (const char *, Uint32): TTF_Font * | <SDL_ttf.h>"
		alias
			"TTF_OpenFont"
		end





	frozen set_SDL_color_r (SDL_color: POINTER; value: NATURAL_8)
			-- Set la valeur de rouge pour le SDL_Color utilisé avec RenderText_Font.
		external
			"C [struct <SDL.h>] (struct SDL_Color, Uint8)"
		alias
			"r"
	end

	frozen set_SDL_color_g (SDL_color: POINTER; value: NATURAL_8)
			-- Set la valeur de vert pour le SDL_Color utilisé avec RenderText_Font.
		external
			"C [struct <SDL.h>] (struct SDL_Color, Uint8)"
		alias
			"g"
	end

	frozen set_SDL_color_b (SDL_color: POINTER; value: NATURAL_8)
			-- Set la valeur de bleu pour le SDL_Color utilisé avec RenderText_Font.
		external
			"C [struct <SDL.h>] (struct SDL_Color, Uint8)"
		alias
			"b"
	end




	frozen TTF_RenderText_Solid(font, text, color:POINTER):POINTER
		external
			"C inline use <SDL_ttf.h>"
		alias
			"TTF_RenderText_Solid((TTF_Font *)$font,(char *)$text, *(SDL_Color *)$color)"
		end

	frozen sizeof_SDL_Color:INTEGER
		external
			"C inline use <SDL_ttf.h>"
		alias
			"sizeof(SDL_Color *)"
		end




feature --mixer
	frozen Mix_Init(flags:INTEGER):INTEGER
		external
			"C (int) : int | <SDL_mixer.h>"
		alias
			"Mix_Init"
		end
	frozen Mix_OpenAudio(frequency:INTEGER; format:NATURAL_16; channels:INTEGER; chunksize:INTEGER):INTEGER
		external
			"C (int, uint16, int, int) : int | <SDL_mixer.h>"
		alias
			"Mix_OpenAudio"
		end
	frozen Mix_LoadMUS(file:POINTER):POINTER
		external
			"C (const char *) : Mix_Music * | <SDL_mixer.h>"
			alias
			"Mix_LoadMUS"
		end
	frozen Mix_PlayMusic(music:POINTER; loops:INTEGER):INTEGER
		external
			"C inline use <SDL_mixer.h>"
			alias
			"Mix_PlayMusic((Mix_Music *)$music,(int)$loops)"
		end



	frozen SDL_RWFromFile(file:POINTER;mode:POINTER):POINTER
		external
			"C (const char *, const char * ) : SDL_RWops * | <SDL_RWops.h>"
			alias
			"SDL_RWFromFile"
		end



feature --Wrapper de la souris
	frozen get_mouse_button (SDL_MouseButtonEvent:POINTER):NATURAL_8
		external
			"C [struct <SDL.h>] (SDL_MouseButtonEvent):Uint8 *"
		alias
			"button"
		end

	frozen get_mouse_y(SDL_MouseButtonEvent:POINTER):NATURAL_16
		external
			"C [struct <SDL.h>] (SDL_MouseButtonEvent):Uint16 *"
		alias
			"y"
		end

	frozen get_mouse_x (SDL_MouseButtonEvent:POINTER):NATURAL_16
		external
			"C [struct <SDL.h>] (SDL_MouseButtonEvent):Uint16 *"
		alias
			"x"
		end

	frozen SDL_MOUSEBUTTONDOWN:NATURAL_8
		external
			"C inline use <SDL.h>"
		alias
			"SDL_MOUSEBUTTONDOWN"
		end

feature -- Sizeof
	frozen sizeof_SDL_Rect:INTEGER
		external
			"C inline use <SDL.h>"
		alias
			"sizeof(struct SDL_Rect)"
		end

	frozen sizeof_SDL_Event:INTEGER
		external
			"C inline use <SDL.h>"
		alias
			"sizeof(SDL_Event)"
		end
end
