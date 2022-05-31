CREATE PROC Modif_Personnel

@id_personnel int,
@personnel_nom char(40),
@personnel_prenom char(40),
@date_embauche date,
@type_adresse2 char(40),
@id_adresse int,
@id_personnel_Encadrer int



AS

UPDATE Personnel 
SET  personnel_nom = @personnel_nom, personnel_prenom = @personnel_prenom, date_embauche = @date_embauche, type_adresse2 = @type_adresse2, id_adresse = @id_adresse, id_personnel_Encadrer = @id_personnel_Encadrer
Where id_personnel =  @id_personnel

EXEC Modif_Personnel

@id_personnel = '4',
@personnel_nom = 'SAVALLE',
@personnel_prenom = 'Florian',
@date_embauche = '2002-1-2',
@type_adresse2 = 'Livraison',
@id_adresse = '22',
@id_personnel_Encadrer = '9'