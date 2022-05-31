CREATE PROC Supprimer_Commande
@id_Commande int 

AS 
	delete from Facturer where id_commande = @id_Commande
	delete from Paiement where id_commande = @id_Commande
	delete from Commande where id_Commande = @id_Commande

EXEC Supprimer_Commande @id_Commande ='1' 

