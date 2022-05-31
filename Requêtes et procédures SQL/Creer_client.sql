CREATE PROC Creer_personnel
@personnel_nom char(40),
@personnel_prenom char(40),
@date_embauche date,
@type_adresse2 char(40),
@id_adresse int,
@id_personnel_encadrer int

AS

INSERT INTO Personnel VALUES (@personnel_nom, @personnel_prenom, @date_embauche, @type_adresse2 , @id_adresse, @id_personnel_encadrer)