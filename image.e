note
	description: "Banque des noms des images."
	author: "Anthony et Étienne"
	date: "28 mars 2013"
	revision: "Alpha 3.2"

class
	IMAGE

feature -- Access
	afficher(a_window:POINTER a_forme:FORME_OBJET)
		local
			l_blit_surface:INTEGER
		do
			{SDL_WRAPPER}.set_SDL_target_area_H(a_forme.target_area, {SDL_WRAPPER}.get_bmp_h(a_forme.l_bmp))
			{SDL_WRAPPER}.set_SDL_target_area_W(a_forme.target_area, {SDL_WRAPPER}.get_bmp_w(a_forme.l_bmp))
			{SDL_WRAPPER}.set_SDL_target_area_X(a_forme.target_area, a_forme.X)
			{SDL_WRAPPER}.set_SDL_target_area_Y(a_forme.target_area, a_forme.Y)

			l_blit_surface := {SDL_WRAPPER}.SDL_BlitSurface(a_forme.l_bmp, create {POINTER}, a_window, a_forme.target_area)
		end
end
