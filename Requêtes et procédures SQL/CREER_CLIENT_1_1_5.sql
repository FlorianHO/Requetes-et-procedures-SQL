CREATE PROC Creer_client
@code_client char(40),
@client_nom char(40),
@client_prenom char(40),
@client_genre char(40),
@client_email char(40),
@client_telephone char(40),
@client_date_anniversaire date,
@numero_rue int, 
@numero_logement int, 
@nom_rue char(40), 
@nom_residence char(40), 
@nom_batiment char(40), 
@etage int, 
@nom_ville char(40),
@type_adresse1 char(40)
AS
	INSERT INTO Client 
		  ([code_client],
           [client_nom],
           [client_prenom],
           [client_genre],
           [client_email],
           [client_telephone],
           [client_date_anniversaire])
	VALUES(@code_client, @client_nom, @client_prenom, @client_genre, @client_email, @client_telephone, @client_date_anniversaire)

	INSERT INTO Adresse 
	VALUES(@numero_rue, @numero_logement, @nom_rue, @nom_residence, @nom_batiment, @etage,@nom_ville)

	INSERT INTO Posseder
	VALUES ((SELECT TOP(1)id_client FROM Client ORDER BY id_client DESC),(SELECT TOP(1)id_adresse FROM Adresse ORDER BY id_adresse DESC),@type_adresse1)

