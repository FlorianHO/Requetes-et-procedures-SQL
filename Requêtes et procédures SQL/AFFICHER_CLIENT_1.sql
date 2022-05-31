CREATE PROC Afficher_Client
@id_client int 

AS 
	select *from Client where id_client = @id_client

EXEC Afficher_Client @id_client ='1'