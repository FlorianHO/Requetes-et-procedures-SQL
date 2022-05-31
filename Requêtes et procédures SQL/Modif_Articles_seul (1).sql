CREATE PROC Modif_Article

@id_article int,
@designation char(40),
@prix_produit_HT int,
@taux_TVA int,
@couleur char(40),
@reference_article char(40)

AS

UPDATE Article 
SET  prix_produit_HT = @prix_produit_HT, taux_TVA = @taux_TVA, couleur = @couleur, designation = @designation,reference_article = @reference_article 
Where id_article =  @id_article

EXEC Modif_Article

@id_article ='1',
@designation = 'clé usb listo deluxe',
@prix_produit_HT = 50,
@taux_TVA = 15,
@couleur = 'rouge',
@reference_article = 'mlkd'



