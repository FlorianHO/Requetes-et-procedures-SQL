CREATE PROC Modif_Article

@designation char(40),
@prix_produit_HT int,
@taux_TVA int,
@couleur char(40),
@reference_article char(40)

AS

UPDATE Article 
SET  prix_produit_HT = @prix_produit_HT, taux_TVA = @taux_TVA, couleur = @couleur, designation = @designation
Where reference_article =  @reference_article

EXEC Modif_Article

@designation = 'clé usb listo deluxe',
@prix_produit_HT = 5,
@taux_TVA = 30,
@couleur = 'zinzolin',
@reference_article = 'mlkd'