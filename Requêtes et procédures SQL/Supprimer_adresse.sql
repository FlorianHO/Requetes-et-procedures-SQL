CREATE PROC suppr_adresse
@id_adresse int
AS

delete from Posseder where id_adresse = 2
delete from Adresse where id_adresse = 2