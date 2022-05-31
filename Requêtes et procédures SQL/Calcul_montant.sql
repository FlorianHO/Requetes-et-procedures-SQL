CREATE PROC Calcul_montant
@id_client int

AS

SELECT SUM(montant_total_TTC) as 'Montant total'
FROM
Commande INNER JOIN Client
ON Commande.id_client = Client.id_client
WHERE Client.id_client = @id_client