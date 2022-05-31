CREATE PROC Chiffre_mois
@date1 date,
@date2 date
AS
SELECT SUM(montant_total_HT) AS 'Somme des ventes'
FROM Commande
WHERE date_emission between @date1 and @date2

EXEC Chiffre_mois
@date1 = '2020-10-01',
@date2 = '2020-10-30'

drop proc  Chiffre_mois

