CREATE PROC Supprimer_Personnel
@id_Personnel int 

AS 
	delete from Personnel where id_Personnel = @id_Personnel
	delete from Adresse where id_adresse NOT IN (SELECT id_adresse from personnel) AND id_adresse not in (select id_adresse from Posseder)


EXEC Supprimer_Personnel @id_Personnel  ='5' 

drop proc Supprimer_Personnel
