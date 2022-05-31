CREATE PROC Creer_commande
@reference_commande char(40),
@date_livraison_prevue date,
@date_emission date,
@total_article int,
@montant_total_HT decimal,
@montant_total_TVA decimal,
@id_client int,
@designation char(40)

AS

BEGIN
INSERT INTO Commande
VALUES (@reference_commande, @date_livraison_prevue, @date_emission, @total_article, @montant_total_HT, @montant_total_TVA, (@montant_total_HT+@montant_total_HT*@montant_total_TVA/100), @id_client)

UPDATE TOP(1) Article
SET Article.id_commande = (SELECT TOP(1)id_commande FROM Commande ORDER BY id_commande DESC), id_catalogue = NULL
WHERE designation = @designation AND id_commande IS NULL 
END