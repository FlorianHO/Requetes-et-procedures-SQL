CREATE PROC Ajouter_Article

@reference_article varchar (40),
@designation char(40),
@prix_produit_HT decimal(18,0),
@taux_TVA int,
@couleur char(40),
@produit char(40),
@id_commande int,
@quantite_produit int

AS

	INSERT INTO Article 
	VALUES (@reference_article,@designation,@prix_produit_HT,@taux_TVA,@couleur,@produit,@id_commande,(SELECT TOP(1)id_catalogue FROM Article WHERE designation = @designation AND id_catalogue IS NOT NULL ORDER BY id_catalogue ASC))

	UPDATE Catalogue
	SET quantite_produit = @quantite_produit + 1

EXEC Ajouter_Article

@reference_article='mlkd',
@designation ='clé usb listo',
@prix_produit_HT='2', 
@taux_TVA ='20',
@couleur ='verte',
@produit ='clé usb',
@quantite_produit = '1',
@id_commande = NULL