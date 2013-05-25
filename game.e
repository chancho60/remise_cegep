note
	description: "Code du jeu principal"
	author: "Anthony et �tienne"
	date: "28 mars 2013"
	revision: "Alpha 3.2"

class
	GAME
inherit
	ARGUMENTS
create
	make
feature -- Access

	make
		local
			l_window,l_target_area, l_menu, l_memory_manager, l_event, l_keysym, l_keyboard_event, l_music:POINTER
			l_c_string_menu, l_c_string_music:C_STRING
			l_blit_surface, l_flip:INTEGER
			l_quit, l_event_type:NATURAL_8
		do

			if
				{SDL_WRAPPER}.SDL_Init({SDL_WRAPPER}.SDL_INIT_VIDEO)<0
			then
				print ("Initialisation de l'initialisation � �chou�!%N")
			end

			create l_c_string_menu.make ("Ressources/menu.bmp")
			l_target_area := l_memory_manager.memory_alloc({SDL_WRAPPER}.sizeof_SDL_Rect)
			l_menu := {SDL_WRAPPER}.SDL_LoadIMG(l_c_string_menu.item)
			l_window := {SDL_WRAPPER}.SDL_SetVideoMode({SDL_WRAPPER}.get_bmp_w(l_menu), {SDL_WRAPPER}.get_bmp_h(l_menu),32, {SDL_WRAPPER}.SDL_SWSURFACE)

			{SDL_WRAPPER}.set_SDL_target_area_H(l_target_area, {SDL_WRAPPER}.get_bmp_h(l_menu))
			{SDL_WRAPPER}.set_SDL_target_area_W(l_target_area, {SDL_WRAPPER}.get_bmp_w(l_menu))
			{SDL_WRAPPER}.set_SDL_target_area_X(l_target_area, 0)
			{SDL_WRAPPER}.set_SDL_target_area_Y(l_target_area, 0)

			l_event := l_memory_manager.memory_alloc({SDL_WRAPPER}.sizeof_SDL_Event)
			l_quit := {SDL_WRAPPER}.SDL_QUIT



			if {SDL_WRAPPER}.Mix_OpenAudio(44100,{SDL_WRAPPER}.Audio_format , 2, 4096)= -1 then
				print("Erreur OpenAudio")
			end


			create l_c_string_music.make ("Ressources/ZeldaMenu.mp3")
			l_music := {SDL_WRAPPER}.Mix_LoadMUS(l_c_string_music.item)



			if{SDL_WRAPPER}.Mix_PlayMusic(l_music, -1)= -1 then
				print("Erreur PlayMusic")
			end





			from
				l_event_type := {SDL_WRAPPER}.get_SDL_EventType(l_event)
			until
				l_quit=l_event_type
			loop

			l_keyboard_event := {SDL_WRAPPER}.get_SDL_EventKey(l_event)
			l_keysym := {SDL_WRAPPER}.get_SDL_keysym(l_keyboard_event)
			l_blit_surface := {SDL_WRAPPER}.SDL_BlitSurface(l_menu, create {POINTER}, l_window, l_target_area)
				if
					{SDL_WRAPPER}.SDL_PollEvent(l_event)<1
				then
				end
				l_event_type := {SDL_WRAPPER}.get_SDL_EventType(l_event)

				if
					l_event_type = {SDL_WRAPPER}.SDL_MOUSEBUTTONDOWN
				then
					if
						{SDL_WRAPPER}.get_mouse_y(l_event) > 412 and {SDL_WRAPPER}.get_mouse_y(l_event) < 476 and {SDL_WRAPPER}.get_mouse_x(l_event) > 473 and {SDL_WRAPPER}.get_mouse_x(l_event) < 765
					then
						l_target_area.memory_free
						l_quit:=l_event_type

					end
					if
						{SDL_WRAPPER}.get_mouse_y(l_event) > 325 and {SDL_WRAPPER}.get_mouse_y(l_event) < 390 and {SDL_WRAPPER}.get_mouse_x(l_event) > 473 and {SDL_WRAPPER}.get_mouse_x(l_event) < 765
					then
						make_menu_multi
						l_quit:=l_event_type

					end
					if
						{SDL_WRAPPER}.get_mouse_y(l_event) > 240 and {SDL_WRAPPER}.get_mouse_y(l_event) < 304 and {SDL_WRAPPER}.get_mouse_x(l_event) > 473 and {SDL_WRAPPER}.get_mouse_x(l_event) < 765
					then
						l_target_area.memory_free
						make_solo
						l_quit:=l_event_type

					end
				end

				l_flip := {SDL_WRAPPER}.SDL_Flip(l_window)
				{SDL_WRAPPER}.SDL_Delay(5)

			end
			if
				{SDL_WRAPPER}.SDL_QuitEvent(l_window)<2
			then
			end
		end






	make_menu_multi
		local
			l_window,l_target_area, l_menu, l_memory_manager, l_event:POINTER
			l_c_string_menu:C_STRING
			l_blit_surface, l_flip:INTEGER
			l_quit, l_event_type:NATURAL_8

		do

			if
				{SDL_WRAPPER}.SDL_Init({SDL_WRAPPER}.SDL_INIT_VIDEO)<0
			then
				print ("Initialisation de l'initialisation � �chou�!%N")
			end

			create l_c_string_menu.make ("Ressources/menu_multijoueur.bmp")
			l_target_area := l_memory_manager.memory_alloc({SDL_WRAPPER}.sizeof_SDL_Rect)
			l_menu := {SDL_WRAPPER}.SDL_LoadIMG(l_c_string_menu.item)
			l_window := {SDL_WRAPPER}.SDL_SetVideoMode({SDL_WRAPPER}.get_bmp_w(l_menu), {SDL_WRAPPER}.get_bmp_h(l_menu),32, {SDL_WRAPPER}.SDL_SWSURFACE)

			{SDL_WRAPPER}.set_SDL_target_area_H(l_target_area, {SDL_WRAPPER}.get_bmp_h(l_menu))
			{SDL_WRAPPER}.set_SDL_target_area_W(l_target_area, {SDL_WRAPPER}.get_bmp_w(l_menu))
			{SDL_WRAPPER}.set_SDL_target_area_X(l_target_area, 0)
			{SDL_WRAPPER}.set_SDL_target_area_Y(l_target_area, 0)

		--EVENT
			l_event := l_memory_manager.memory_alloc({SDL_WRAPPER}.sizeof_SDL_Event)
			l_quit := {SDL_WRAPPER}.SDL_QUIT
			from
				l_event_type := {SDL_WRAPPER}.get_SDL_EventType(l_event)
			until
				l_quit=l_event_type
			loop

			l_blit_surface := {SDL_WRAPPER}.SDL_BlitSurface(l_menu, create {POINTER}, l_window, l_target_area)
				if
					{SDL_WRAPPER}.SDL_PollEvent(l_event)<1
				then
				end
				l_event_type := {SDL_WRAPPER}.get_SDL_EventType(l_event)
				if
					l_event_type = {SDL_WRAPPER}.SDL_MOUSEBUTTONDOWN
				then
					if
						{SDL_WRAPPER}.get_mouse_y(l_event) > 240 and {SDL_WRAPPER}.get_mouse_y(l_event) < 423 and {SDL_WRAPPER}.get_mouse_x(l_event) > 230 and {SDL_WRAPPER}.get_mouse_x(l_event) < 594
					then
						make_serveur
						l_quit:=l_event_type
					end
					if
						{SDL_WRAPPER}.get_mouse_y(l_event) > 240 and {SDL_WRAPPER}.get_mouse_y(l_event) < 423 and {SDL_WRAPPER}.get_mouse_x(l_event) > 659 and {SDL_WRAPPER}.get_mouse_x(l_event) < 982
					then
						make_client
						l_quit:=l_event_type
					end
				end


				l_flip := {SDL_WRAPPER}.SDL_Flip(l_window)
				{SDL_WRAPPER}.SDL_Delay(5)

			end
			if
				{SDL_WRAPPER}.SDL_QuitEvent(l_window)<2
			then
			end
		end









	make_client
		local
			l_memory_manager, l_target_area, l_bmp, l_window, l_event:POINTER
			l_image_nom:STRING
			l_c_string_bmp:C_STRING
			l_blit_surface, l_flip:INTEGER
			l_quit, l_event_type:NATURAL_8
			l_img:IMAGE
			l_barre, l_barre2:FORME_OBJET
			l_deplacement:DEPLACEMENT
			l_balle:BALLE
			l_pointage: POINTAGE
			l_point:BOOLEAN
			l_mur_haut, l_mur_bas:FORME_OBJET
			l_music:POINTER
			l_client:RESEAU_CLIENT
			l_c_string_music:C_STRING
			l_bonus_thread:BONUS_THREAD
			l_bonus:BONUS
			env:EXECUTION_ENVIRONMENT
			l_compteur:INTEGER
		do
			create env
			--cr�ation des objets et background
			if
				{SDL_WRAPPER}.SDL_Init({SDL_WRAPPER}.SDL_INIT_VIDEO)<0
			then
				print ("Initialisation de l'initialisation � �chou�!%N")
			end
			create l_memory_manager.default_create
			create l_img
			create l_pointage.creer_pointage
			create l_mur_haut.creer_forme(0,0,"Ressources/mur_jeu.bmp")
			create l_mur_bas.creer_forme(0,700,"Ressources/mur_jeu.bmp")
			create l_barre.creer_forme(10, 300,"Ressources/player1_jeu.bmp")
			create l_barre2.creer_forme(1250, 300,"Ressources/player1_jeu.bmp")
			create l_balle.creer_balle(30, 450)
			create l_deplacement
			create l_client.creer_client
			create l_bonus_thread.make
			create l_bonus.creer_bonus (602,305)
			l_bonus_thread.launch
			l_image_nom := "Ressources/background_jeu.bmp"
			create l_c_string_bmp.make (l_image_nom)
			l_target_area := l_memory_manager.memory_alloc({SDL_WRAPPER}.sizeof_SDL_Rect)
			l_bmp := {SDL_WRAPPER}.SDL_LoadIMG(l_c_string_bmp.item)
			l_window := {SDL_WRAPPER}.SDL_SetVideoMode({SDL_WRAPPER}.get_bmp_w(l_bmp), {SDL_WRAPPER}.get_bmp_h(l_bmp),32, {SDL_WRAPPER}.SDL_SWSURFACE)



			{SDL_WRAPPER}.set_SDL_target_area_H(l_target_area, {SDL_WRAPPER}.get_bmp_h(l_bmp))
			{SDL_WRAPPER}.set_SDL_target_area_W(l_target_area, {SDL_WRAPPER}.get_bmp_w(l_bmp))
			{SDL_WRAPPER}.set_SDL_target_area_X(l_target_area, 0)
			{SDL_WRAPPER}.set_SDL_target_area_Y(l_target_area, 0)





			l_event := l_memory_manager.memory_alloc({SDL_WRAPPER}.sizeof_SDL_Event)


			if {SDL_WRAPPER}.Mix_OpenAudio(44100, 32784, 2, 4096)= -1 then
				print("Erreur OpenAudio")
			end


			create l_c_string_music.make ("Ressources/ZeldaWav.mp3")
			l_music := {SDL_WRAPPER}.Mix_LoadMUS(l_c_string_music.item)



			if{SDL_WRAPPER}.Mix_PlayMusic(l_music, -1)= -1 then
				print("Erreur PlayMusic")
			end

			l_pointage.ttf_init
			l_pointage.ttf_openfont

			from -- boucle principale du jeu
				l_event_type := {SDL_WRAPPER}.get_SDL_EventType(l_event)
				l_quit := {SDL_WRAPPER}.SDL_QUIT
			until
				l_quit=l_event_type
			loop
				--d�but gestion du clavier
				if
					{SDL_WRAPPER}.SDL_PollEvent(l_event)<1
				then
				end
				l_event_type := {SDL_WRAPPER}.get_SDL_EventType(l_event)

				if
					l_event_type = {SDL_WRAPPER}.SDL_KEYDOWN
				then
					l_deplacement.bouton_presse(l_event, l_barre2)----en attendant le r�seau
				end
				--fin gestion du clavier
				l_barre.set_player1_y (l_client.recevoir - l_barre.y)
				l_client.envoyer(l_barre2)

				l_blit_surface := {SDL_WRAPPER}.SDL_BlitSurface(l_bmp, create {POINTER}, l_window, l_target_area)

				l_pointage.ttf_pointage(l_window)
				if
					l_pointage.l_fin_jeu = true AND l_compteur = 1
				then
					{SDL_WRAPPER}.SDL_Delay(4000)
					l_bonus_thread.stop_thread
					l_bonus_thread.join
					l_target_area.memory_free
					make
					l_quit:=l_event_type
				end


				l_deplacement.balle (l_balle, l_barre, l_barre2)
				l_img.afficher(l_window, l_mur_haut)
				l_img.afficher(l_window, l_mur_bas)
				l_img.afficher(l_window, l_barre)
				l_img.afficher(l_window, l_barre2)

				if
					l_compteur >= 850
				then
					l_img.afficher (l_window, l_bonus.l_image[l_bonus_thread.i])
					if
						l_balle.X > l_bonus.l_image[1].x and l_balle.x < l_bonus.l_image[1].x+75 and l_balle.y < l_bonus.l_image[1].y+111 and l_balle.y > l_bonus.l_image[1].y
					then
						l_bonus.effet(l_balle)
					end
				end

					l_compteur := l_compteur + 1

				--Point pour le cot� droit
				if
					l_balle.X > 1220
				then
					l_balle.set_vitesse (20)
					l_compteur := 0
					l_point := true
					l_pointage.point_joueur1()
					l_point := false
					l_balle.set_x ((30).as_integer_16-l_balle.x)
					l_balle.set_player1_y ((300).as_integer_16-l_balle.y)
					env.sleep (3000000000)
				end

				--Point pour le cot� gauche
				if
					l_balle.x < 30
				then
					l_compteur := 0
					l_balle.set_vitesse (20)
					l_point := true
					l_pointage.point_joueur2()
					l_point := false
					l_balle.set_x ((1220).as_integer_16-l_balle.x)
					l_balle.set_player1_y ((300).as_integer_16-l_balle.y)
					env.sleep (3000000000)
				end

				--afficher balle
				if
					l_point = false
				then
					l_img.afficher(l_window, l_balle)
				end

				l_flip := {SDL_WRAPPER}.SDL_Flip(l_window)

				{SDL_WRAPPER}.SDL_Delay(1)
			end

			if
				{SDL_WRAPPER}.SDL_QuitEvent(l_window)<2
			then
			end

			l_bonus_thread.stop_thread
			l_bonus_thread.join
			l_client.fin
			l_target_area.memory_free
		end

	make_serveur
		local
			l_memory_manager, l_target_area, l_bmp, l_window, l_event:POINTER
			l_image_nom:STRING
			l_c_string_bmp:C_STRING
			l_blit_surface, l_flip:INTEGER
			l_quit, l_event_type:NATURAL_8
			l_img:IMAGE
			l_barre, l_barre2:FORME_OBJET
			l_deplacement:DEPLACEMENT
			l_balle:BALLE
			l_pointage: POINTAGE
			l_point:BOOLEAN
			l_mur_haut, l_mur_bas:FORME_OBJET
			l_music:POINTER
			l_serveur:RESEAU_SERVEUR
			l_c_string_music:C_STRING
			l_bonus_thread:BONUS_THREAD
			l_bonus:BONUS
			env:EXECUTION_ENVIRONMENT
			l_compteur:INTEGER
		do
			create env
			--cr�ation des objets et background
			if
				{SDL_WRAPPER}.SDL_Init({SDL_WRAPPER}.SDL_INIT_VIDEO)<0
			then
				print ("Initialisation de l'initialisation � �chou�!%N")
			end
			create l_memory_manager.default_create
			create l_img
			create l_pointage.creer_pointage
			create l_mur_haut.creer_forme(0,0,"Ressources/mur_jeu.bmp")
			create l_mur_bas.creer_forme(0,700,"Ressources/mur_jeu.bmp")
			create l_barre.creer_forme(10, 300,"Ressources/player1_jeu.bmp")
			create l_barre2.creer_forme(1250, 300,"Ressources/player1_jeu.bmp")
			create l_balle.creer_balle(30, 450)
			create l_deplacement
			create l_serveur.creer_reseau
			create l_bonus_thread.make
			create l_bonus.creer_bonus (602,305)
			l_bonus_thread.launch
			l_image_nom := "Ressources/background_jeu.bmp"
			create l_c_string_bmp.make (l_image_nom)
			l_target_area := l_memory_manager.memory_alloc({SDL_WRAPPER}.sizeof_SDL_Rect)
			l_bmp := {SDL_WRAPPER}.SDL_LoadIMG(l_c_string_bmp.item)
			l_window := {SDL_WRAPPER}.SDL_SetVideoMode({SDL_WRAPPER}.get_bmp_w(l_bmp), {SDL_WRAPPER}.get_bmp_h(l_bmp),32, {SDL_WRAPPER}.SDL_SWSURFACE)



			{SDL_WRAPPER}.set_SDL_target_area_H(l_target_area, {SDL_WRAPPER}.get_bmp_h(l_bmp))
			{SDL_WRAPPER}.set_SDL_target_area_W(l_target_area, {SDL_WRAPPER}.get_bmp_w(l_bmp))
			{SDL_WRAPPER}.set_SDL_target_area_X(l_target_area, 0)
			{SDL_WRAPPER}.set_SDL_target_area_Y(l_target_area, 0)





			l_event := l_memory_manager.memory_alloc({SDL_WRAPPER}.sizeof_SDL_Event)


			if {SDL_WRAPPER}.Mix_OpenAudio(44100, 32784, 2, 4096)= -1 then
				print("Erreur OpenAudio")
			end


			create l_c_string_music.make ("Ressources/ZeldaWav.mp3")
			l_music := {SDL_WRAPPER}.Mix_LoadMUS(l_c_string_music.item)



			if{SDL_WRAPPER}.Mix_PlayMusic(l_music, -1)= -1 then
				print("Erreur PlayMusic")
			end

			l_pointage.ttf_init
			l_pointage.ttf_openfont

			from -- boucle principale du jeu
				l_event_type := {SDL_WRAPPER}.get_SDL_EventType(l_event)
				l_quit := {SDL_WRAPPER}.SDL_QUIT
			until
				l_quit=l_event_type
			loop
				--d�but gestion du clavier
				if
					{SDL_WRAPPER}.SDL_PollEvent(l_event)<1
				then
				end
				l_event_type := {SDL_WRAPPER}.get_SDL_EventType(l_event)

				if
					l_event_type = {SDL_WRAPPER}.SDL_KEYDOWN
				then
					l_deplacement.bouton_presse(l_event, l_barre)
				end
				--fin gestion du clavier

				l_serveur.envoyer(l_barre)
			    l_barre2.set_player1_y (l_serveur.recevoir-l_barre2.y)

				l_blit_surface := {SDL_WRAPPER}.SDL_BlitSurface(l_bmp, create {POINTER}, l_window, l_target_area)

				l_pointage.ttf_pointage(l_window)
				if
					l_pointage.l_fin_jeu = true AND l_compteur = 1
				then
					{SDL_WRAPPER}.SDL_Delay(4000)
					l_bonus_thread.stop_thread
					l_bonus_thread.join
					l_target_area.memory_free
					make
					l_quit:=l_event_type
				end


				l_deplacement.balle (l_balle, l_barre, l_barre2)
				l_img.afficher(l_window, l_mur_haut)
				l_img.afficher(l_window, l_mur_bas)
				l_img.afficher(l_window, l_barre)
				l_img.afficher(l_window, l_barre2)

				if
				l_compteur >= 850
				then
					l_img.afficher (l_window, l_bonus.l_image[l_bonus_thread.i])
					if
						l_balle.X > l_bonus.l_image[1].x and l_balle.x < l_bonus.l_image[1].x+75 and l_balle.y < l_bonus.l_image[1].y+111 and l_balle.y > l_bonus.l_image[1].y
					then
						l_bonus.effet(l_balle)
					end
				end

				l_compteur := l_compteur + 1

				--Point pour le cot� droit
				if
					l_balle.X > 1220
				then
					l_balle.set_vitesse (20)
					l_compteur := 0
					l_point := true
					l_pointage.point_joueur1()
					l_point := false
					l_balle.set_x ((30).as_integer_16-l_balle.x)
					l_balle.set_player1_y ((300).as_integer_16-l_balle.y)
					env.sleep (3000000000)
				end

				--Point pour le cot� gauche
				if
					l_balle.x < 30
				then
					l_compteur := 0
					l_balle.set_vitesse (20)
					l_point := true
					l_pointage.point_joueur2()
					l_point := false
					l_balle.set_x ((1220).as_integer_16-l_balle.x)
					l_balle.set_player1_y ((300).as_integer_16-l_balle.y)
					env.sleep (3000000000)
				end

				--afficher balle
				if
					l_point = false
				then
					l_img.afficher(l_window, l_balle)
				end

				l_flip := {SDL_WRAPPER}.SDL_Flip(l_window)

				{SDL_WRAPPER}.SDL_Delay(1)
			end

			if
				{SDL_WRAPPER}.SDL_QuitEvent(l_window)<2
			then
			end

			l_bonus_thread.stop_thread
			l_bonus_thread.join
			l_serveur.close_reseau
			l_target_area.memory_free
		end




	make_solo
		local
			l_memory_manager, l_target_area, l_bmp, l_window, l_event:POINTER
			l_image_nom:STRING
			l_c_string_bmp:C_STRING
			l_blit_surface, l_flip:INTEGER
			l_quit, l_event_type:NATURAL_8
			l_img:IMAGE
			l_barre, l_barre2:FORME_OBJET
			l_deplacement:DEPLACEMENT
			l_balle:BALLE
			l_pointage: POINTAGE
			l_point:BOOLEAN
			l_mur_haut, l_mur_bas:FORME_OBJET
			l_music:POINTER
			l_c_string_music:C_STRING
			l_bonus_thread:BONUS_THREAD
			l_bonus:BONUS
			env:EXECUTION_ENVIRONMENT
			l_compteur:INTEGER
		do
			create env
			--cr�ation des objets et background
			if
				{SDL_WRAPPER}.SDL_Init({SDL_WRAPPER}.SDL_INIT_VIDEO)<0
			then
				print ("Initialisation de l'initialisation � �chou�!%N")
			end
			create l_memory_manager.default_create
			create l_img
			create l_pointage.creer_pointage
			create l_mur_haut.creer_forme(0,0,"Ressources/mur_jeu.bmp")
			create l_mur_bas.creer_forme(0,700,"Ressources/mur_jeu.bmp")
			create l_barre.creer_forme(10, 300,"Ressources/player1_jeu.bmp")
			create l_barre2.creer_forme(1250, 300,"Ressources/player1_jeu.bmp")
			create l_balle.creer_balle(30, 450)
			create l_deplacement
			create l_bonus_thread.make
			create l_bonus.creer_bonus (602,305)
			l_bonus_thread.launch
			l_image_nom := "Ressources/background_jeu.bmp"
			create l_c_string_bmp.make (l_image_nom)
			l_target_area := l_memory_manager.memory_alloc({SDL_WRAPPER}.sizeof_SDL_Rect)
			l_bmp := {SDL_WRAPPER}.SDL_LoadIMG(l_c_string_bmp.item)
			l_window := {SDL_WRAPPER}.SDL_SetVideoMode({SDL_WRAPPER}.get_bmp_w(l_bmp), {SDL_WRAPPER}.get_bmp_h(l_bmp),32, {SDL_WRAPPER}.SDL_SWSURFACE)



			{SDL_WRAPPER}.set_SDL_target_area_H(l_target_area, {SDL_WRAPPER}.get_bmp_h(l_bmp))
			{SDL_WRAPPER}.set_SDL_target_area_W(l_target_area, {SDL_WRAPPER}.get_bmp_w(l_bmp))
			{SDL_WRAPPER}.set_SDL_target_area_X(l_target_area, 0)
			{SDL_WRAPPER}.set_SDL_target_area_Y(l_target_area, 0)


			l_compteur := 0


			l_event := l_memory_manager.memory_alloc({SDL_WRAPPER}.sizeof_SDL_Event)


			if {SDL_WRAPPER}.Mix_OpenAudio(44100, 32784, 2, 4096)= -1 then
				print("Erreur OpenAudio")
			end


			create l_c_string_music.make ("Ressources/ZeldaWav.mp3")
			l_music := {SDL_WRAPPER}.Mix_LoadMUS(l_c_string_music.item)



			if{SDL_WRAPPER}.Mix_PlayMusic(l_music, -1)= -1 then
				print("Erreur PlayMusic")
			end

			l_pointage.ttf_init
			l_pointage.ttf_openFont

			from -- boucle principale du jeu
				l_event_type := {SDL_WRAPPER}.get_SDL_EventType(l_event)
				l_quit := {SDL_WRAPPER}.SDL_QUIT
			until
				l_quit=l_event_type
			loop
				--d�but gestion du clavier
				if
					{SDL_WRAPPER}.SDL_PollEvent(l_event)<1
				then
				end
				l_event_type := {SDL_WRAPPER}.get_SDL_EventType(l_event)

				if
					l_event_type = {SDL_WRAPPER}.SDL_KEYDOWN
				then
					l_deplacement.bouton_presse(l_event, l_barre)
				end
				--fin gestion du clavier



				--Balle direction
				if
					l_barre2.y+85 > l_balle.y
				then
					if
						l_barre2.Y > 30
					then
						l_barre2.set_player1_Y(-15)
					end
				end

				if
					l_barre2.y+85 < l_balle.y
				then
					if
						l_barre2.y <= 490
					then
						l_barre2.set_player1_Y(15)
					end
				end

				l_blit_surface := {SDL_WRAPPER}.SDL_BlitSurface(l_bmp, create {POINTER}, l_window, l_target_area)




				l_pointage.ttf_pointage(l_window)
				if
					l_pointage.l_fin_jeu = true AND l_compteur = 1
				then
					{SDL_WRAPPER}.SDL_Delay(4000)
					l_bonus_thread.stop_thread
					l_bonus_thread.join
					l_target_area.memory_free
					make
					l_quit:=l_event_type
				end


				l_deplacement.balle (l_balle, l_barre, l_barre2)
				l_img.afficher(l_window, l_mur_haut)
				l_img.afficher(l_window, l_mur_bas)
				l_img.afficher(l_window, l_barre)
				l_img.afficher(l_window, l_barre2)

			if
				l_compteur >= 850
			then
				l_img.afficher (l_window, l_bonus.l_image[l_bonus_thread.i])
				if
					l_balle.X > l_bonus.l_image[1].x and l_balle.x < l_bonus.l_image[1].x+75 and l_balle.y < l_bonus.l_image[1].y+111 and l_balle.y > l_bonus.l_image[1].y
				then
					l_bonus.effet(l_balle)
				end
			end

				l_compteur := l_compteur + 1

				--Point pour le cot� droit
				if
					l_balle.X > 1220
				then
					l_balle.set_vitesse (20)
					l_compteur := 0
					l_point := true
					l_pointage.point_joueur1()
					l_point := false
					l_balle.set_x ((30).as_integer_16-l_balle.x)
					l_balle.set_player1_y ((300).as_integer_16-l_balle.y)
					env.sleep (3000000000)
				end

				--Point pour le cot� gauche
				if
					l_balle.x < 30
				then
					l_compteur := 0
					l_balle.set_vitesse (20)
					l_point := true
					l_pointage.point_joueur2()
					l_point := false
					l_balle.set_x ((1220).as_integer_16-l_balle.x)
					l_balle.set_player1_y ((300).as_integer_16-l_balle.y)
					env.sleep (3000000000)
				end

				--afficher balle
				if
					l_point = false
				then
					l_img.afficher(l_window, l_balle)
				end

				l_flip := {SDL_WRAPPER}.SDL_Flip(l_window)

				{SDL_WRAPPER}.SDL_Delay(1)
			end

			if
				{SDL_WRAPPER}.SDL_QuitEvent(l_window)<2
			then
			end
			l_bonus_thread.stop_thread
			l_bonus_thread.join
			l_target_area.memory_free
		end
end
