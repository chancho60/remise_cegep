note
	description: "Code des bonus. (Bonus)"
	author: "Anthony et Étienne"
	date: "28 mars 2013"
	revision: "Alpha 3.2"

class
	BONUS_THREAD

inherit
	THREAD
	rename
		make as make_thread
	end

create
	make

feature {ANY} -- Initialization

	make ()
		do
			make_thread
			must_stop := false
		end

feature -- Access

	stop_thread
		do
			must_stop := true
		end

feature {ANY} -- Thread methods

	execute
		do
			create env
			from
			i:=1
			until
				must_stop
			loop
				i:=i+1
				env.sleep (100000000)
				if i=10 then
					i:=1
				end
			end
		end

feature {ANY} -- Implementation

	must_stop: BOOLEAN
	i: INTEGER_16
	env:EXECUTION_ENVIRONMENT

invariant
	i_est_reglo_thread: i <= 12 and i >= 0

end
