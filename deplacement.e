note
	description: "Code du deplacement des sprites."
	author: "Anthony et Étienne"
	date: "28 mars 2013"
	revision: "Alpha 3.2"

class
	DEPLACEMENT

feature
	bouton_presse(a_event:POINTER a_barre:FORME_OBJET)
		local
			l_keyboard_event, l_keysym:POINTER
		do
			l_keyboard_event := {SDL_WRAPPER}.get_SDL_EventKey(a_event)
			l_keysym := {SDL_WRAPPER}.get_SDL_keysym(l_keyboard_event)
			if-----down
				{SDL_WRAPPER}.get_SDL_sym(l_keysym) = {SDL_WRAPPER}.SDLK_DOWN
			then
				if
					a_barre.y < 500
				then
					a_barre.set_player1_Y(10)
				end

			end
			if----up
				{SDL_WRAPPER}.get_SDL_sym(l_keysym) = {SDL_WRAPPER}.SDLK_UP
			then
				if
					a_barre.Y > 20
				then
					a_barre.set_player1_Y(-10)
				end
			end
	end

	balle(a_balle:BALLE a_barre1:FORME_OBJET a_barre2:FORME_OBJET)
		local
			l_colision_32:INTEGER_32
		do  ---vérifications
			if
				a_balle.droite
			then
				if
					a_balle.X+a_balle.vitesse > 1220
				then
					-----centre
					if
						a_balle.y >= a_barre2.y + 50 and a_balle.y +30 <= a_barre2.y +150
					then
						l_colision_32 := a_balle.X-(1220-(a_balle.vitesse-(1220-a_balle.X)))
						a_balle.set_x(l_colision_32.as_integer_16)
						a_balle.set_droite (false)
					end
					----section du haut
					if
						a_balle.y + 30 >= a_barre2.y and a_balle.y < a_barre2.y+50
					then
						l_colision_32 := a_balle.X-(1220-(a_balle.vitesse-(1220-a_balle.X)))
						a_balle.set_x(l_colision_32.as_integer_16)
						a_balle.set_droite (false)
						a_balle.set_monte (true)
					end
					----section du bas
					if
						a_balle.y +30 > a_barre2.y +150 and a_balle.y <= a_barre2.y +200
					then
						l_colision_32 := a_balle.X-(1220-(a_balle.vitesse-(1220-a_balle.X)))
						a_balle.set_x(l_colision_32.as_integer_16)
						a_balle.set_droite (false)
						a_balle.set_monte (false)
					end
				end
			end
			if
				a_balle.droite = false
			then
				if
					a_balle.X-a_balle.vitesse < 30
				then
					----centre
					if
						a_balle.y >= a_barre1.y + 50 and a_balle.y +30 <= a_barre1.y +150
					then
						l_colision_32 := a_balle.X-(30+(a_balle.vitesse-(a_balle.X-30)))
						a_balle.set_x (l_colision_32.as_integer_16)
						a_balle.set_droite (true)
					end
					----section du haut
					if
						a_balle.y + 30 >= a_barre1.y and a_balle.y < a_barre1.y+50
					then
						l_colision_32 := a_balle.X-(30+(a_balle.vitesse-(a_balle.X-30)))
						a_balle.set_x (l_colision_32.as_integer_16)
						a_balle.set_droite (true)
						a_balle.set_monte (true)
					end
					----section du bas
					if
						a_balle.y +30 > a_barre1.y +150 and a_balle.y <= a_barre1.y +200
					then
						l_colision_32 := a_balle.X-(30+(a_balle.vitesse-(a_balle.X-30)))
						a_balle.set_x (l_colision_32.as_integer_16)
						a_balle.set_droite (true)
						a_balle.set_monte (false)
					end
				end
			end



			if
				a_balle.monte
			then
				if
					a_balle.y-a_balle.vitesse < 30
				then
					a_balle.set_monte (false)
				end
			end

			if
				a_balle.monte = false
			then
				if
					a_balle.Y+a_balle.vitesse > 670
				then
					a_balle.set_monte (true)
				end
			end


			 ---déplacement
			 if
			 	a_balle.droite
			 then
			 	a_balle.set_x (a_balle.vitesse)
			 end
			 if
			 	a_balle.droite = false
			 then
			 	a_balle.set_x (-a_balle.vitesse)
			 end

			 if
			 	a_balle.monte
			 then
			 	a_balle.set_player1_Y (-a_balle.vitesse)
			 end
			 if
			 	a_balle.monte = false
			 then
			 	a_balle.set_player1_Y (a_balle.vitesse)
			 end
		end
end
