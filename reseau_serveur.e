note
	description: "Gestion du reseau"
	author: "Anthony et Étienne"
	date: "11 avril 2013"
	revision: "Alpha 3.2"

class
	RESEAU_SERVEUR

inherit
	GAME

create
	creer_reseau
feature

		l_serveur_address, l_client_address: NETWORK_SOCKET_ADDRESS
		l_serveur_socket:  NETWORK_STREAM_SOCKET
		l_client_socket: NETWORK_STREAM_SOCKET

	creer_reseau
		local
			l_port:INTEGER
			on:BOOLEAN
		do
			l_port := 12345
--			io.put_string ("Ouverture du serveur sur le port: "+l_port.out+".%N")
			create l_serveur_socket.make_server_by_port (l_port)
			l_serveur_address:=l_serveur_socket.address
--			io.put_string ("Socket ouvert et en ecoute sur l'adresse:"+l_serveur_address.host_address.host_address+":"+l_serveur_address.port.out+".%N")
			l_serveur_socket.listen (1)
			l_serveur_socket.accept
			l_client_socket:=l_serveur_socket.accepted
--			l_client_address:=l_client_socket.peer_address
--			io.put_string ("Connexion établie!(Serveur)")

--			l_client_socket.put_integer_16 (300)
		end
	envoyer(a_barre2:FORME_OBJET)
		do
--			io.put_string ("envoi")
        	l_client_socket.put_integer_16 (a_barre2.y)
   		end
   	recevoir:INTEGER_16
   		do
--   		io.put_string ("reception")
   			l_client_socket.read_integer_16
   			result := l_client_socket.last_integer_16
   		end
	close_reseau
		do
			l_client_socket.close
			l_serveur_socket.close
		end
end
