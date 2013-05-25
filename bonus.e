note
	description: "Code des bonus. (Bonus)"
	author: "Anthony et Étienne"
	date: "28 mars 2013"
	revision: "Alpha 3.2"

class
	BONUS

inherit
	FORME_OBJET

	IMAGE
create
	creer_bonus
feature {ANY}-- Access
		i:INTEGER_16
		l_image:LIST[FORME_OBJET]
		creer_bonus(a_X:INTEGER_16 a_Y:INTEGER_16)
		require
			a_X < 1300
			a_X > 0
			a_Y < 720
			a_Y > 0
		do
			create {ARRAYED_LIST[FORME_OBJET]} l_image.make(10)
			from
				i := 1
			until
				i=11
			loop
				l_image.extend (create {FORME_OBJET}.creer_forme (a_X,a_Y ,"Ressources/sword/"+i.out+".png" ))
				i:=i+1
			end
		end

		effet(a_balle: BALLE)
		do
			a_balle.set_vitesse (a_balle.vitesse+1)
		end
invariant
	i_est_reglo_bonus: i <= 12 and i >= 0
end
