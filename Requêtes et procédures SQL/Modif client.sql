CREATE PROC Modif_Client

@id_client int,
@code_client char(40),
@client_nom char(40),
@client_prenom char(40),
@client_genre char(10),
@client_email char(40),
@client_telephone char(40),
@client_date_anniversaire date

AS

UPDATE Client 
SET code_client = @code_client, client_nom = @client_nom, client_prenom = @client_prenom, client_genre = @client_genre, client_email = @client_email, client_telephone = @client_telephone, client_date_anniversaire = @client_date_anniversaire
Where id_client =  @id_client
