note
	description: "Gestion du pointage"
	author: "Anthony et Étienne"
	date: "28 mars 2013"
	revision: "Alpha 3.2"

class
	POINTAGE

inherit
	IMAGE
create
	creer_pointage
feature
	l_insert: SQLITE_INSERT_STATEMENT
	l_query: SQLITE_QUERY_STATEMENT
	l_modify: SQLITE_MODIFY_STATEMENT
	l_set: SQLITE_RESULT_SET
	l_db: SQLITE_DATABASE
	l_font:POINTER
	l_point1:INTEGER
	l_point2:INTEGER
	but:BOOLEAN
	color:POINTER
	l_memory_manager:POINTER
	text:C_STRING
	textImage:POINTER
	test:POINTER
	l_fin_jeu:BOOLEAN

--Initialisation du TTF et validation d'erreur.
ttf_init
	do
		if
			{SDL_WRAPPER}.TTF_INIT < 0
		then
			print ("Initialisation Text a échoué!%N")
		end
	end

--Creation et Ouverture de la font
ttf_openFont
	local
		l_c_string_font:C_STRING
	do
		create l_c_string_font.make ("Ressources/game_over.ttf")
		l_font := {SDL_WRAPPER}.TTF_OpenFont(l_c_string_font.item, 200)

		color := l_memory_manager.memory_alloc({SDL_WRAPPER}.sizeof_SDL_Color)
		{SDL_WRAPPER}.set_SDL_color_r(color,255)
		{SDL_WRAPPER}.set_SDL_color_g(color,255)
		{SDL_WRAPPER}.set_SDL_color_b(color,255)

		create text.make ("0           0")

		textImage:={SDL_WRAPPER}.TTF_RenderText_Solid(l_font, text.item, color)
	end

ttf_pointage(l_window:POINTER)
	local
		l_target_area:POINTER

	do
		if
			but = true
		then
			l_fin_jeu:=false
			l_point1 := 0
			l_point2 := 0
			create l_query.make ("SELECT * FROM pointage WHERE joueur = '1';", l_db)
			l_query.execute (agent (ia_row: SQLITE_RESULT_ROW): BOOLEAN
				do
					l_point1 := ia_row.integer_value (2)
				end)

			create l_query.make ("SELECT * FROM pointage WHERE joueur = '2';", l_db)
			l_query.execute (agent (ia_row: SQLITE_RESULT_ROW): BOOLEAN
				do
					l_point2 := ia_row.integer_value (2)
				end)

			if
				l_point1 = 7 OR l_point2 = 7
			then
				if
					l_point1 = 7
				then
					create text.make ("Bravo joueur 1!")
					l_fin_jeu:=true
				end
				if
					l_point2 = 7
				then
					create text.make  ("Bravo joueur 2!")
					l_fin_jeu:=true
				end
			else
				create text.make (l_point1.out+"           "+l_point2.out)
			end


			textImage:={SDL_WRAPPER}.TTF_RenderText_Solid(l_font, text.item, color)
			but := false
		end

		l_target_area := l_memory_manager.memory_alloc({SDL_WRAPPER}.sizeof_SDL_Rect)
		{SDL_WRAPPER}.set_SDL_target_area_H(l_target_area, 0)
		{SDL_WRAPPER}.set_SDL_target_area_W(l_target_area, 0)
		{SDL_WRAPPER}.set_SDL_target_area_X(l_target_area, 500)
		{SDL_WRAPPER}.set_SDL_target_area_Y(l_target_area, 20)


		if {SDL_WRAPPER}.SDL_BlitSurface(textImage, create {POINTER}, l_window, l_target_area)<1  then
		end
	end

	creer_pointage
			-- Run application.

		do
			create l_db.make_create_read_write ("BD/pointage.sqlite")

        	-- Remove any existing table
			create l_modify.make ("DROP TABLE IF EXISTS pointage;", l_db)
			l_modify.execute

			-- Create a new table
			create l_modify.make ("CREATE TABLE `pointage` (`Joueur` INTEGER PRIMARY KEY, `Points` INTEGER);", l_db)
			l_modify.execute

			create l_insert.make ("INSERT INTO `pointage` (`Points`) VALUES (:POINT1);", l_db)
			check l_insert_is_compiled: l_insert.is_compiled end
			l_insert.execute_with_arguments ([create {SQLITE_DOUBLE_ARG}.make (":POINT1", 0)])


			create l_insert.make ("INSERT INTO `pointage` (`Points`) VALUES (:POINT2);", l_db)
			check l_insert_is_compiled: l_insert.is_compiled end
			l_insert.execute_with_arguments ([create {SQLITE_DOUBLE_ARG}.make (":POINT2", 0)])

			l_db.begin_transaction (False)
			l_db.commit

end

point_joueur1
		local
			l_update: SQLITE_MODIFY_STATEMENT
		do
			create l_query.make ("SELECT * FROM pointage WHERE joueur = '1';", l_db)
			l_query.execute (agent (ia_row: SQLITE_RESULT_ROW): BOOLEAN
				do
					l_point1 := ia_row.integer_value (2)
				end)

			l_point1:= l_point1+1
			create l_update.make ("UPDATE `pointage` SET `Points`=:POINT1 WHERE `Joueur` = 1;", l_db)
			check l_update_is_compiled: l_update.is_compiled end

			l_db.begin_transaction (False)
			l_update.execute_with_arguments ([create {SQLITE_INTEGER_ARG}.make (":POINT1", l_point1)])

			l_db.commit
			but := true

		end

point_joueur2
		local
			l_update: SQLITE_MODIFY_STATEMENT
		do
			create l_query.make ("SELECT * FROM pointage WHERE joueur = '2';", l_db)
			l_query.execute (agent (ia_row: SQLITE_RESULT_ROW): BOOLEAN
				do
					l_point2 := ia_row.integer_value (2)
				end)

			l_point2:= l_point2+1
			create l_update.make ("UPDATE `pointage` SET `Points`=:POINT2 WHERE `Joueur` = 2;", l_db)
			check l_update_is_compiled: l_update.is_compiled end

			l_db.begin_transaction (False)
			l_update.execute_with_arguments ([create {SQLITE_INTEGER_ARG}.make (":POINT2", l_point2)])

			l_db.commit
			but := true

		end

end
