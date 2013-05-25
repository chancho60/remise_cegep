note
	description: "Code des positions des sprites."
	author: "Anthony et Étienne"
	date: "28 mars 2013"
	revision: "Alpha 3.2"

class
	FORME_OBJET
inherit
	GAME
create
	creer_forme
feature
	Y:INTEGER_16 assign set_player1_Y
	X:INTEGER_16 assign set_X
	target_area, l_bmp:POINTER
	nom:STRING

	creer_forme(a_X:INTEGER_16 a_Y:INTEGER_16 a_nom:STRING)
		local
			l_memory_manager:POINTER
			l_c_string_png:C_STRING
		do
			create l_memory_manager.default_create
			create l_c_string_png.make (a_nom)
			target_area := l_memory_manager.memory_alloc({SDL_WRAPPER}.sizeof_SDL_Rect)
			l_bmp := {SDL_WRAPPER}.SDL_LoadIMG(l_c_string_png.item)
			Y:=a_Y
			X:=a_X
			nom:=a_nom
		end
		---------------------------------------------player
	set_player1_Y(a_Y:INTEGER_16)
		do
			Y := Y+a_Y
		end
	set_X(a_X:INTEGER_16)
		do
			X := X+a_X
		end

end
