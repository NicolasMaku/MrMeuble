INSERT INTO exercice( annee ,date_debut) VALUES (2024, '01/01/2024');
INSERT INTO exercice( annee ,date_debut) VALUES (2025, '01/01/2025');

INSERT INTO centre (nom, categorie) VALUES ('ADM/DIST', 0);
INSERT INTO centre (nom, categorie) VALUES ('USINE', 1);
INSERT INTO centre (nom, categorie) VALUES ('ATELIER', 1);

INSERT INTO unite_oeuvre(nom) VALUES
      ('KG'),
      ('Kwh'),
      ('L'),
      ('M'),
      ('Unite');

INSERT INTO type_rubrique (libelle, nature, incorporabilite, id_unite_oeuvre) VALUES ('ACHAT SEMANCE', 1, 0, 1);
INSERT INTO type_rubrique (libelle, nature, incorporabilite, id_unite_oeuvre) VALUES ('ACHAT BOIS', 1, 1, 1);
INSERT INTO type_rubrique (libelle, nature, incorporabilite, id_unite_oeuvre) VALUES ('EAU ET ELECTRICITE', 1, 1, 1);
INSERT INTO type_rubrique (libelle, nature, incorporabilite, id_unite_oeuvre) VALUES ('Loyer', 0, 0, 1);

INSERT INTO imputation (id_centre, id_type_rubrique, pourcentage) VALUES (2, 1, 90);
INSERT INTO imputation (id_centre, id_type_rubrique, pourcentage) VALUES (3, 1, 10);
INSERT INTO imputation (id_centre, id_type_rubrique, pourcentage) VALUES (2, 2, 50);
INSERT INTO imputation (id_centre, id_type_rubrique, pourcentage) VALUES (3, 2, 50);
INSERT INTO imputation (id_centre, id_type_rubrique, pourcentage) VALUES (1, 3, 20);
INSERT INTO imputation (id_centre, id_type_rubrique, pourcentage) VALUES (2, 3, 50);
INSERT INTO imputation (id_centre, id_type_rubrique, pourcentage) VALUES (3, 3, 30);

INSERT INTO imputation (id_centre, id_type_rubrique, pourcentage) VALUES (1, 4, 0);
INSERT INTO imputation (id_centre, id_type_rubrique, pourcentage) VALUES (2, 4, 0);
INSERT INTO imputation (id_centre, id_type_rubrique, pourcentage) VALUES (3, 4, 0);

INSERT INTO rubrique (id_type_rubrique, prix_unitaire, quantite, id_exercice) values
      (1, 25000, 2, 1),
      (2,35000, 3, 1),
      (1, 25000, 4, 1),
      (3, 55000, 3, 2),
      (4, 24000, 4, 1);

insert into produit (libelle, quantite, id_centre, id_exercice, date_sortie) VALUES
    ("");

insert into utilisateur (username, password) values ('root','root');

insert into produit_finit(id_produit_finit, nom) values (default, 'Chaise');
insert into produit_finit(id_produit_finit, nom) values (default, 'Lit');
insert into produit_finit(id_produit_finit, nom) values (default, 'Armoire');
insert into produit_finit(id_produit_finit, nom) values (default, 'Table');

insert into marchandise(id_marchandise, nom, id_unite_oeuvre) values
      (default, 'Bois', 1),
      (default, 'Vis', 1),
      (default, 'Metal', 1);

insert into  fournisseur(nom, daty, compte) values
('Dago', '01/05/2024', '4010001'),
('Quinz', '01/05/2024', '4010002');

INSERT INTO produit_marchandise(id_produit_finit, id_marchandise, quantite) VALUES
     (1, 1, 4),
     (1, 2, 10),
     (2, 1, 6),
     (2, 2, 20),
     (2, 3, 4),
     (3, 1, 8),
     (3, 2, 15),
     (4, 1, 10),
     (4, 2, 12),
     (4, 3, 6);