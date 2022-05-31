CREATE PROC Supprimer_Article_Total
@designation char(40)

AS 
	
	delete from Article where designation = @designation and id_commande is NULL
	delete from Catalogue where id_catalogue NOT IN (SELECT Article.id_catalogue from Article WHERE Article.id_catalogue IN (SELECT id_catalogue FROM Catalogue))
	


EXEC Supprimer_Article_Total @designation ='téléphone portable Doro'

drop proc Supprimer_Article_Total
	



