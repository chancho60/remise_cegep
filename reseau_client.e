note
	description: "Summary description for {RESEAU_CLIENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	RESEAU_CLIENT
create
	creer_client
feature -- Initialization+

	l_socket: NETWORK_STREAM_SOCKET

    creer_client
        local
            l_addr_factory:INET_ADDRESS_FACTORY
            l_address:INET_ADDRESS
            l_addr:STRING
            l_port:INTEGER
        do
            create l_addr_factory
            print("Entrez le IP du serveur:")
            io.read_line
            l_addr:=io.last_string
            --l_addr:="10.70.16.254"
            l_port:=12345

            io.put_string ("Ouverture du client. Adresse: "+l_addr+", port: "+l_port.out+".%N")

            l_address:= l_addr_factory.create_from_name (l_addr)
            create l_socket.make_client_by_address_and_port (l_address, l_port)
            l_socket.connect
            io.put_string ("Connexion établie!(Client)")

		end
	envoyer(a_barre2:FORME_OBJET)
		do
        	l_socket.put_integer_16 (a_barre2.y)
   		end
   	recevoir:INTEGER_16
   		do
   			l_socket.read_integer_16
   			result := l_socket.last_integer_16
   		end
   	fin
   		do
   			l_socket.close
   		end
end
