USE [SOUTENANCE]
GO
/****** Object:  StoredProcedure [dbo].[creer_facture]    Script Date: 03/12/2021 10:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[creer_facture]

AS

INSERT INTO [dbo].[Facture]
           ([nom_societe]
           ,[adresse_societe]
           ,[numero_service_client]
           ,[Logo_societe])
     VALUES
           ('Vigno Incorporated','13 rue des Vigno','06 24 15 78 10',(SELECT * FROM OPENROWSET(BULK N'C:\Users\Paul DESPONT\Desktop\golemago_2_1.png', SINGLE_BLOB) AS MonImage))