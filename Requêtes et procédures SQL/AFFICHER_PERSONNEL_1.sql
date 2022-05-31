CREATE PROC Afficher_Peronnel
@id_Personnel int 

AS 
	select *from Personnel where id_Personnel = @id_Personnel

EXEC Afficher_Personnel @id_Personnel ='1'

