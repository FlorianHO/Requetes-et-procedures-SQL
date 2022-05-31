CREATE PROC Supprimer_Client
@id_Client int ,
@id_commande int,
@id_paiement int

AS 
	delete from Article where id_commande = @id_commande
	delete from Facturer where id_paiement = @id_paiement
	delete from Paiement where id_paiement = @id_paiement
	delete from Paiement where id_commande = @id_commande
	delete from Commande where id_Client = @id_Client
	delete from Posseder where id_Client = @id_Client
	delete from Client where id_Client = @id_Client

	
EXEC Supprimer_Client
@id_Client  ='6',
@id_commande = NULL,
@id_paiement = NULL

drop proc Supprimer_Client