CREATE PROC Creer_Article
@reference_article varchar (40),
@designation char(40),
@prix_produit_HT decimal(18,0),
@taux_TVA int,
@couleur char(40),
@produit char(40),
@id_commande int,
@quantite_produit int,
@seuil_reapprovisionnement decimal(18,0)

AS

	INSERT INTO Catalogue 
	VALUES (@quantite_produit,@seuil_reapprovisionnement)

	INSERT INTO Article 
	VALUES (@reference_article,@designation,@prix_produit_HT,@taux_TVA,@couleur,@produit,@id_commande,(SELECT TOP(1)id_catalogue FROM Catalogue ORDER BY id_catalogue DESC))

EXEC Creer_Article

@quantite_produit ='20',
@seuil_reapprovisionnement ='10',
@reference_article='gyuj',
@designation ='Clé usb pisto',
@prix_produit_HT='100', 
@taux_TVA ='20',
@couleur ='rouge',
@produit ='clé usb',
@id_commande =NULL





