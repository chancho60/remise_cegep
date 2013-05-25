note
	description: "Code de la balle. (Image de la balle)"
	author: "Anthony et Étienne"
	date: "28 mars 2013"
	revision: "Alpha 3.2"

class
	BALLE

inherit
	FORME_OBJET

	IMAGE
create
	creer_balle

feature -- Access
		vitesse:INTEGER_16
		monte, droite:BOOLEAN


		creer_balle(a_X:INTEGER_16 a_Y:INTEGER_16)
		require
			a_X < 1300
			a_X > 0
			a_Y < 720
			a_Y > 0
		do
			creer_forme(a_X, a_Y, "Ressources/balle_jeu.png")
			droite := true
			vitesse := 20
		end

		set_vitesse(a_vitesse_temp:INTEGER_16)
			do
				vitesse := a_vitesse_temp
			end
		set_monte(a_monte_temp:BOOLEAN)
			do
				monte := a_monte_temp
			end
		set_droite(a_droite_temp:BOOLEAN)
			do
				droite := a_droite_temp
			end
invariant
	Vitesse_est_positive: vitesse > 0
end
