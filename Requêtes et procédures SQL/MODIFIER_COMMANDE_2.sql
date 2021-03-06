CREATE PROC Modif_Commande

@id_commande int,
@reference_commande char(40),
@date_livraison_prevue char(40),
@date_emission date,
@total_article char(40),
@montant_total_HT int,
@montant_total_TVA int,
@montant_total_TTC int



AS

UPDATE Commande
SET  reference_commande = @reference_commande, date_livraison_prevue = @date_livraison_prevue, date_emission = @date_emission, total_article = @total_article, montant_total_HT = @montant_total_HT, montant_total_TVA = @montant_total_TVA, montant_total_TTC = @montant_total_TTC
where id_commande = @id_commande

EXEC Modif_Commande

@id_commande = '2',
@reference_commande ='BR10SDA',
@date_livraison_prevue ='2020-08-15',
@date_emission ='2020-08-10',
@total_article ='10',
@montant_total_HT ='100',
@montant_total_TVA ='20',
@montant_total_TTC ='120'
