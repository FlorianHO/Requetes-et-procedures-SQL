-- FICHIER SETUP --
-- PROJET POO --
-- EQUIPE 3  --
-- Florian SAVALLE
-- Florian HOUDU
-- Paul Despont

----------------------------------------------------------
-- Suivre l'ordre du fichier pour l'execution des INSERT
----------------------------------------------------------

--#########################################################################################
--1) CREATION DES TABLES --

--Table: Ville

CREATE TABLE Ville(
        nom_ville   Char (40) NOT NULL,
        code_postal Char (40),
        pays        Char (40),
		CONSTRAINT Ville_PK PRIMARY KEY (nom_ville)
)

-- Table: Client

CREATE TABLE Client(
        id_client                Int  IDENTITY(1,1)  NOT NULL ,
        code_client              Char (40),
        client_nom               Char (40),
        client_prenom            Char (40),
        client_genre             Char (10),
        client_email             Char (40),
        client_telephone         Char (40),
        client_date_anniversaire Date,
				CONSTRAINT Client_PK PRIMARY KEY (id_client)
)

--Table: Adresse

CREATE TABLE Adresse(
        id_adresse      Int  IDENTITY(1,1)  NOT NULL ,
        numero_rue      Int,
        numero_logement Int,
        nom_rue         Char (40),
        nom_residence   Char (40),
        nom_batiment    Char (40),
        etage           Int,
        nom_ville       Char (40),
        		CONSTRAINT Adresse_PK PRIMARY KEY (id_adresse)
)

--Table: Commande

CREATE TABLE Commande(
        id_commande           Int  IDENTITY(1,1) NOT NULL,
        reference_commande    Varchar (40),
        date_livraison_prevue Date,
        date_emission         Date,
        total_article         Int,
        montant_total_HT      Decimal,
        montant_total_TVA     Decimal,
        montant_total_TTC     Decimal,
        id_client             Int NOT NULL,
		CONSTRAINT Commande_PK PRIMARY KEY (id_commande)
)

--Table: Paiement

CREATE TABLE Paiement(
        id_paiement          Int  IDENTITY(1,1)  NOT NULL ,
        montant              Decimal,
        moyen_paiement       Char (40),
        date_paiement        Date,
        date_solde_reglement Date,
        id_commande          Int,
		CONSTRAINT Paiement_PK PRIMARY KEY (id_paiement)
)

--Table: Catalogue

CREATE TABLE Catalogue(
        id_catalogue              Int  IDENTITY(1,1)  NOT NULL ,
        quantite_produit          Int,
        seuil_reapprovisionnement Decimal,
		CONSTRAINT Catalogue_PK PRIMARY KEY (id_catalogue)
)

--Table: Article

CREATE TABLE Article(
        id_article        Int  IDENTITY(1,1)  NOT NULL ,
        reference_article Varchar (40),
        designation       Char (40),
        prix_produit_HT   Decimal,
        taux_TVA          Int,
        couleur           Char (40),
        produit           Char (40),
        id_commande       Int ,
        id_catalogue      Int ,
		CONSTRAINT Article_PK PRIMARY KEY (id_article)
)

--Table: Facture

CREATE TABLE Facture(
        id_facture            int  IDENTITY(1,1)  NOT NULL ,
        nom_societe           Char (40),
        adresse_societe       Char (40),
        numero_service_client Char (40),
		logo_societe IMAGE,
		CONSTRAINT Facture_PK PRIMARY KEY (id_facture)
)

--Table: Facturer

CREATE TABLE Facturer(
        id_paiement Int NOT NULL,
        id_commande Int NOT NULL,
        id_adresse  Int NOT NULL,
        id_facture  Int NOT NULL,
		CONSTRAINT Facturer_PK PRIMARY KEY (id_paiement,id_commande,id_adresse,id_facture)
)

--Table: Personnel

CREATE TABLE Personnel(
        id_personnel          Int  IDENTITY(1,1) NOT NULL,
        personnel_nom         Char (40),
        personnel_prenom      Char (40),
        date_embauche         Date,
        type_adresse2         Char (40),
        id_adresse            Int,
        id_personnel_Encadrer Int ,
		CONSTRAINT Personnel_PK PRIMARY KEY (id_personnel)
)

-- Table: Posseder 

CREATE TABLE Posseder(
        id_client     Int NOT NULL ,
        id_adresse    Int NOT NULL ,
        type_adresse1 Char (40) NOT NULL
	,CONSTRAINT Posseder_PK PRIMARY KEY (id_client,id_adresse)
)


ALTER TABLE Adresse
	ADD CONSTRAINT Adresse_Ville0_FK
	FOREIGN KEY (nom_ville)
	REFERENCES Ville(nom_ville);

ALTER TABLE Commande
	ADD CONSTRAINT Commande_Client0_FK
	FOREIGN KEY (id_client)
	REFERENCES Client(id_client);

ALTER TABLE Paiement
	ADD CONSTRAINT Paiement_Commande0_FK
	FOREIGN KEY (id_commande)
	REFERENCES Commande(id_commande);

ALTER TABLE Article
	ADD CONSTRAINT Article_Commande0_FK
	FOREIGN KEY (id_commande)
	REFERENCES Commande(id_commande);

ALTER TABLE Article
	ADD CONSTRAINT Article_Catalogue1_FK
	FOREIGN KEY (id_catalogue)
	REFERENCES Catalogue(id_catalogue);

ALTER TABLE Posseder
	ADD CONSTRAINT Posseder_Client0_FK
	FOREIGN KEY (id_client)
	REFERENCES Client(id_client);

ALTER TABLE Posseder
	ADD CONSTRAINT Posseder_Adresse1_FK
	FOREIGN KEY (id_adresse)
	REFERENCES Adresse(id_adresse);

ALTER TABLE Facturer
	ADD CONSTRAINT Facturer_Paiement0_FK
	FOREIGN KEY (id_paiement)
	REFERENCES Paiement(id_paiement);

ALTER TABLE Facturer
	ADD CONSTRAINT Facturer_Commande1_FK
	FOREIGN KEY (id_commande)
	REFERENCES Commande(id_commande);

ALTER TABLE Facturer
	ADD CONSTRAINT Facturer_Adresse2_FK
	FOREIGN KEY (id_adresse)
	REFERENCES Adresse(id_adresse);

ALTER TABLE Facturer
	ADD CONSTRAINT Facturer_Facture3_FK
	FOREIGN KEY (id_facture)
	REFERENCES Facture(id_facture);

ALTER TABLE Personnel
	ADD CONSTRAINT Personnel_Adresse0_FK
	FOREIGN KEY (id_adresse)
	REFERENCES Adresse(id_adresse);

ALTER TABLE Personnel
	ADD CONSTRAINT Personnel_Personnel1_FK
	FOREIGN KEY (id_personnel_Encadrer)
	REFERENCES Personnel(id_personnel)
--#########################################################################################
--2) REMPLISSAGE DES TABLES --

-- Table: Ville

INSERT INTO Ville (nom_ville, code_postal, pays)
VALUES
('Paris', '75065', 'France'),
('Marseille', '13055', 'France'),
('Lyon', '69123', 'France'),
('Toulouse', '31555', 'France'),
('Nice', '06088', 'France'),
('Nantes', '44109', 'France'),
('Montpellier', '34172', 'France'),
('Strasbourg', '67482', 'France'),
('Bordeaux', '33063', 'France'),
('Lille', '59350', 'France'),
('Rennes', '35238', 'France'),
('Reims', '51454', 'France'),
('Toulon', '83137', 'France'),
('Saint-Étienne', '42218', 'France'),
('Le Havre', '76351', 'France'),
('Grenoble', '38185', 'France'),
('Dijon', '21231', 'France'),
('Angers', '49007', 'France'),
('Villeurbanne', '69266', 'France'),
('Nîmes', '30189', 'France'),
('Clermont-Ferrand', '63113', 'France'),
('Le Mans', '72181', 'France'),
('Aix-en-Provence', '13001', 'France'),
('Brest', '29019', 'France'),
('Tours', '37261', 'France'),
('Amiens', '80021', 'France'),
('Limoges', '87085', 'France'),
('Annecy', '74010', 'France'),
('Boulogne-Billancourt', '92012', 'France'),
('Perpignan', '66136', 'France'),
('Besançon', '25056', 'France'),
('Metz', '57463', 'France'),
('Orléans', '45234', 'France'),
('Saint-Denis', '93066', 'France'),
('Rouen', '76540', 'France'),
('Argenteuil', '95018', 'France'),
('Montreuil', '93048', 'France'),
('Mulhouse', '68224', 'France'),
('Caen', '14118', 'France'),
('Nancy', '54395', 'France')

-- Table: Client

insert into Client (code_client, client_nom, client_prenom, client_genre, client_email, client_telephone, client_date_anniversaire) values (180464, 'Dobbinson', 'Corney', 'M', 'cdobbinson0@fastcompany.com', '06 56 24 86 15', '1995-05-22');
insert into Client (code_client, client_nom, client_prenom, client_genre, client_email, client_telephone, client_date_anniversaire) values (168628, 'Wiltsher', 'Guendolen', 'F', 'gwiltsher1@time.com', '06 16 56 82 84', '1995-07-19');
insert into Client (code_client, client_nom, client_prenom, client_genre, client_email, client_telephone, client_date_anniversaire) values (942479, 'Konke', 'Gussy', 'F', 'gkonke2@artisteer.com', '06 28 15 47 82', '1973-08-18');
insert into Client (code_client, client_nom, client_prenom, client_genre, client_email, client_telephone, client_date_anniversaire) values (520630, 'Brickett', 'Pierre', 'M', 'pbrickett3@craigslist.org', '06 95 62 50 10', '1997-01-28');
insert into Client (code_client, client_nom, client_prenom, client_genre, client_email, client_telephone, client_date_anniversaire) values (543311, 'Odney', 'Shina', 'F', 'sodney4@huffingtonpost.com', '06 84 85 74 14', '1978-11-03');
insert into Client (code_client, client_nom, client_prenom, client_genre, client_email, client_telephone, client_date_anniversaire) values (188016, 'Gaiter', 'Jodie', 'F', 'jgaiter5@ebay.com', '06 52 14 52 14', '1985-10-18');
insert into Client (code_client, client_nom, client_prenom, client_genre, client_email, client_telephone, client_date_anniversaire) values (810462, 'Flintoft', 'Sadella', 'F', 'sflintoft6@vistaprint.com', '06 32 51 47 85', '1993-12-29');
insert into Client (code_client, client_nom, client_prenom, client_genre, client_email, client_telephone, client_date_anniversaire) values (372409, 'Barreau', 'Chase', 'M', 'cbarreau7@ycombinator.com', '06 32 15 25 68', '1975-04-07');
insert into Client (code_client, client_nom, client_prenom, client_genre, client_email, client_telephone, client_date_anniversaire) values (753894, 'Eglinton', 'Alicea', 'F', 'aeglinton8@google.com', '06 58 48 95 63', '1976-04-17');
insert into Client (code_client, client_nom, client_prenom, client_genre, client_email, client_telephone, client_date_anniversaire) values (840016, 'Weighell', 'Leontine', 'F', 'lweighell9@dmoz.org', '06 47 56 20 14', '1988-01-15');

-- Table: Personnel

INSERT INTO [dbo].[Personnel]
           ([personnel_nom]
           ,[personnel_prenom]
           ,[date_embauche]
           ,[type_adresse2]
           ,[id_personnel_Encadrer])
     VALUES
           ('Ribes','Florian','2018-10-10','Livraison','1'),
           ('Savalle','Fabien','2017-5-24','Livraison',NULL),
		   ('Antoine','Paul','2020-10-17','Livraison',NULL),
		   ('Despont','Florian','2021-1-25','Livraison',NULL),
		   ('Houdu','Talla','2018-7-21','Livraison',NULL),
		   ('Diop','Florian','2016-12-28','Livraison','6'),
		   ('Lamouroux','Mattéo','2021-7-28','Livraison','7'),
		   ('Fauvel','Gabriel','2015-10-18','Livraison',NULL),
		   ('Lioppe','Emmanuel','2020-7-29','Livraison',NULL),
		   ('Malondo','Théophile','2017-4-17','Livraison',NULL)

-- Table: Adresse 

INSERT INTO [dbo].[Adresse]
           ([numero_rue]
           ,[numero_logement]
           ,[nom_rue]
           ,[nom_residence]
           ,[nom_batiment]
           ,[etage]
           ,[nom_ville])
        
     VALUES
           ('10','22','Rue des champs',NULL,NULL,NULL,'Rouen'),
		   ('10','22','Rue des champs',NULL,NULL,NULL,'Rouen'),
		   ('22','160','Rue du Haut des Cours ','Résidence du Rouvray','Bâtiment 7','4','Rouen'),
		   ('22','160','Rue du Haut des Cours ','Résidence du Rouvray','Bâtiment 7','4','Rouen'),
		   ('14','20','Rue des loups',NULL,NULL,NULL,'Paris'),
		   ('14','20','Rue des loups',NULL,NULL,NULL,'Paris'),
		   ('7','40','Route des chiens',NULL,NULL,NULL,'Marseille'),
		   ('10','25','Rue de l église',NULL,NULL,NULL,'Marseille'),
		   ('14','47','Grande rue',NULL,NULL,NULL,'Lyon'),
		   ('14','47','Grande rue',NULL,NULL,NULL,'Lyon'),
		   ('20','140','Rue du Moulin','Résidence Bourg ','Bâtiment 1','6','Saint-Étienne'),
		   ('20','140','Rue du Moulin','Résidence Bourg ','Bâtiment 1','6','Saint-Étienne'),
		   ('4','7','Place de la Mairie',NULL,NULL,NULL,'Montpellier'),
		   ('4','7','Place de la Mairie',NULL,NULL,NULL,'Montpellier'),
		   ('1','40','Rue du Château','Les béguinages','Bâtiment rouge','10','Marseille'),
		   ('1','40','Rue du Château','Les béguinages','Bâtiment rouge','10','Marseille'),
		   ('20','65','Rue de la Gare ',NULL,NULL,NULL,'Toulouse'),
		   ('10','40','Rue du Stade ',NULL,NULL,NULL,'Marseille'),
		   ('14','47','Grande rue',NULL,NULL,NULL,'Toulouse'),
		   ('150','12','Rue principale',NULL,NULL,NULL,'Lyon'),
           ('1','24','Rue de la Fontaine','Résidence Clovis','Bâtiment 9','8','Paris'),
		   ('47','100','Rue Pasteur',NULL,NULL,NULL,'Rouen'),
		   ('6','12','Rue des Jardins',NULL,NULL,NULL,'Lyon'),
		   ('9','58','Rue Victor-Hugo',NULL,NULL,NULL,'Rouen'),
		   ('23','63','Rue du Moulin',NULL,NULL,NULL,'Rouen'),
		   ('47','22','Rue de la Paix','Résidence Clovis','Bâtiment des pains','10','Paris'),
		   ('85','96','Place Clemenceau',NULL,NULL,NULL,'Marseille'),
		   ('52','14','Rue des Halles','Résidence nain','Bâtiment A','20','Nice'),
		   ('5','75','Rue du Massacre',NULL,NULL,NULL,'Grenoble'),
		   ('43','25','Rue Maulévrier',NULL,NULL,NULL,'Angers')

-- Table: ID Personnel

UPDATE Personnel
SET id_adresse = '21'
WHERE id_personnel = 1;
UPDATE Personnel
SET id_adresse = '22'
WHERE id_personnel = 2;
UPDATE Personnel
SET id_adresse = '23'
WHERE id_personnel = 3;
UPDATE Personnel
SET id_adresse = '24'
WHERE id_personnel = 4;
UPDATE Personnel
SET id_adresse = '25'
WHERE id_personnel = 5;
UPDATE Personnel
SET id_adresse = '26'
WHERE id_personnel = 6;
UPDATE Personnel
SET id_adresse = '27'
WHERE id_personnel = 7;
UPDATE Personnel
SET id_adresse = '28'
WHERE id_personnel = 8;
UPDATE Personnel
SET id_adresse = '29'
WHERE id_personnel = 9;
UPDATE Personnel
SET id_adresse = '30'
WHERE id_personnel = 10;

-- Table: Commande

INSERT INTO [dbo].[Commande]
           ([reference_commande]
           ,[date_livraison_prevue]
           ,[date_emission]
           ,[total_article]
           ,[montant_total_HT]
           ,[montant_total_TVA]
           ,[montant_total_TTC]
           ,[id_client])
     VALUES
           ('CODO2020ROU1','2020-10-25','2020-10-15','1','50','10','60','1'),
           ('BRPI2020ROU2','2020-8-15','2020-8-10','3','125','25','150','4'),
           ('BACH2020MAR3','2020-7-28','2020-7-18','1','200','40','240','8'),
           ('WELE2020LYO4','2020-2-25','2020-3-20','2','102','20.4','123','10')

-- Table: Paiement

INSERT INTO Paiement
VALUES
((SELECT montant_total_TTC FROM Commande WHERE id_commande = 1), 'CB', '2020-10-13', '2020-10-14', 1),
((SELECT montant_total_TTC FROM Commande WHERE id_commande = 2), 'Cash', '2020-8-05', '2020-8-10', 2),
(((SELECT montant_total_TTC FROM Commande WHERE id_commande = 3)/2), 'CB', '2020-7-13', '2020-7-16', 3),
(((SELECT montant_total_TTC FROM Commande WHERE id_commande = 3)/2), 'CB', '2020-7-15', '2020-7-16', 3),
((SELECT montant_total_TTC FROM Commande WHERE id_commande = 4), 'Chèque', '2020-3-10', '2020-3-12', 4)

-- Table: Catalogue seuil

INSERT INTO Catalogue 
VALUES
(NULL, '10'),
(NULL, '2'),
(NULL, '10'),
(NULL, '2'),
(NULL, '2'),
(NULL, '1')

-- Table: Article 

INSERT INTO [dbo].[Article]
           ([reference_article]
           ,[designation]
           ,[prix_produit_HT]
           ,[taux_TVA]
           ,[couleur]
           ,[produit]
		   ,[id_commande]
		   ,[id_catalogue])
           
     VALUES
           ('mlkd','clé usb listo','2','20','verte','clé usb',(SELECT id_commande FROM Commande WHERE reference_commande = 'BRPI2020ROU2'),NULL),
           ('erte','téléphone portable Crosscall Core  ','200','20','bleu','téléphone portable',NULL,'2'),
           ('egtr','clé essentielB ','3','20','rouge','clé usb',(SELECT id_commande FROM Commande WHERE reference_commande = 'BRPI2020ROU2'),NULL),
           ('erta','Barette de RAM kingstone ','120','20','orange','barette de RAM',(SELECT id_commande FROM Commande WHERE reference_commande = 'BRPI2020ROU2'),NULL),
           ('erta','Barette de RAM kingstone ','120','20','orange','barette de RAM',NULL,'4'),
           ('efvy','téléphone portable Doro','50','20','rose','téléphone portable',NULL,'5'),
           ('ftgt','carte son Astro MixAmp','100','20','rose','carte son',NULL,'6'),
           ('efvy','téléphone portable Doro ','50','20','rose','téléphone portable',(SELECT id_commande FROM Commande WHERE reference_commande = 'CODO2020ROU1'),NULL),
           ('efvy','téléphone portable Doro','5','20','rose','téléphone portable',NULL,'5'),
           ('mlkd','clé usb listo','2','20','verte','clé usb',(SELECT id_commande FROM Commande WHERE reference_commande = 'WELE2020LYO4'),NULL),
           ('mlkd','clé usb listo','2','20','verte','clé usb',NULL,'1'),
           ('erte','téléphone portable Crosscall Core ','200','20','bleu','téléphone portable',(SELECT id_commande FROM Commande WHERE reference_commande = 'BACH2020MAR3'),NULL),
           ('efvy','téléphone portable Doro','50','20','rose','téléphone portable',NULL,'5'),
           ('ftgt','carte son Astro MixAmp','100','20','rose','carte son',(SELECT id_commande FROM Commande WHERE reference_commande = 'WELE2020LYO4'),NULL),
           ('ftgt','carte son Astro MixAmp','100','20','rose','carte son',NULL,'6'),
           ('egtr','clé essentielB','3','20','rouge','clé usb',NULL,'3'),
		   ('efvy','téléphone portable Doro','50','20','rose','téléphone portable',NULL,'5'),
		   ('efvy','téléphone portable Doro','50','20','rose','téléphone portable',NULL,'5'),
		   ('egtr','clé essentielB','3','20','rouge','clé usb',NULL,'3'),
		   ('egtr','clé essentielB','3','20','rouge','clé usb',NULL,'3'),
		   ('egtr','clé essentielB','3','20','rouge','clé usb',NULL,'3'),
		   ('erta','Barette de RAM kingstone ','120','20','orange','barette de RAM',NULL,'4'),
		   ('erta','Barette de RAM kingstone ','120','20','orange','barette de RAM',NULL,'4'),
		   ('erta','Barette de RAM kingstone ','120','20','orange','barette de RAM',NULL,'4')

-- Table: Catalogue stock

UPDATE Catalogue
SET Catalogue.quantite_produit = (SELECT COUNT(id_article) FROM Article INNER JOIN Catalogue ON article.id_catalogue = Catalogue.id_catalogue WHERE Catalogue.id_catalogue = 1)
WHERE id_catalogue = 1;
UPDATE Catalogue
SET Catalogue.quantite_produit = (SELECT COUNT(id_article) FROM Article INNER JOIN Catalogue ON article.id_catalogue = Catalogue.id_catalogue WHERE Catalogue.id_catalogue = 2)
WHERE id_catalogue = 2;
UPDATE Catalogue
SET Catalogue.quantite_produit = (SELECT COUNT(id_article) FROM Article INNER JOIN Catalogue ON article.id_catalogue = Catalogue.id_catalogue WHERE Catalogue.id_catalogue = 3)
WHERE id_catalogue = 3;
UPDATE Catalogue
SET Catalogue.quantite_produit = (SELECT COUNT(id_article) FROM Article INNER JOIN Catalogue ON article.id_catalogue = Catalogue.id_catalogue WHERE Catalogue.id_catalogue = 4)
WHERE id_catalogue = 4;
UPDATE Catalogue
SET Catalogue.quantite_produit = (SELECT COUNT(id_article) FROM Article INNER JOIN Catalogue ON article.id_catalogue = Catalogue.id_catalogue WHERE Catalogue.id_catalogue = 5)
WHERE id_catalogue = 5;
UPDATE Catalogue
SET Catalogue.quantite_produit = (SELECT COUNT(id_article) FROM Article INNER JOIN Catalogue ON article.id_catalogue = Catalogue.id_catalogue WHERE Catalogue.id_catalogue = 6)
WHERE id_catalogue = 6;

-- Table Facture 

INSERT INTO [dbo].[Facture]
           ([nom_societe]
           ,[adresse_societe]
           ,[numero_service_client]
           ,[Logo_societe])
     VALUES
           ('Vigno Incorporated','13 rue des Vigno','06 24 15 78 10',NULL),
		   ('Vigno Incorporated','13 rue des Vigno','06 24 15 78 10',NULL),
		   ('Vigno Incorporated','13 rue des Vigno','06 24 15 78 10',NULL),
		   ('Vigno Incorporated','13 rue des Vigno','06 24 15 78 10',NULL),
		   ('Vigno Incorporated','13 rue des Vigno','06 24 15 78 10',NULL)

     
GO

-- Table Facturer

INSERT INTO [dbo].[Facturer]
           ([id_paiement]
           ,[id_commande]
           ,[id_adresse]
           ,[id_facture])
     VALUES
           ('1','1','1','1'),
		   ('2','2','8','2'),
		   ('3','3','16','3'),
		   ('4','3','16','4'),
		   ('5','4','19','5')
        
-- Table Posseder : 


INSERT INTO [dbo].[Posseder]
           ([id_client]
           ,[id_adresse]
           ,[type_adresse1])
     VALUES
('1', '1', 'Facturation'),
('1', '2', 'Livraison'),
('2', '3', 'Livraison'),
('2', '4', 'Facturation'),
('3', '5', 'Livraison'),
('3', '6', 'Facturation'),
('4', '7', 'Livraison'),
('4', '8', 'Facturation'),
('5', '9', 'Livraison'),
('5', '10', 'Facturation'),
('6', '11', 'Livraison'),
('6', '12', 'Facturation'),
('7', '13', 'Livraison'),
('7', '14', 'Facturation'),
('8', '15', 'Livraison'),
('8', '16', 'Facturation'),
('9', '17', 'Livraison'),
('9', '18', 'Facturation'),
('10', '19', 'Facturation'),
('10', '20', 'Livraison')





