CREATE PROC Ajouter_Article_Commande_nimp
@designation char(40),
@id_commande int
AS
BEGIN
UPDATE TOP(1) Article
SET Article.id_commande = @id_commande, id_catalogue = NULL
WHERE designation = @designation AND id_commande IS NULL 
END