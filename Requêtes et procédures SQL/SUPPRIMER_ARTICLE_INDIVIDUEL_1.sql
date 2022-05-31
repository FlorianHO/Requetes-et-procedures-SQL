CREATE PROC Supprimer_Article
@id_Article int 

AS 
	delete from Article where id_Article = @id_Article

EXEC Supprimer_Article @id_Article  ='1'

	



