create database mr_meuble;

\c mr_meuble

create table utilisateur (
    id serial primary key,
    username varchar(100),
    password varchar(100)
);

create table exercice(
    id_exercice serial PRIMARY KEY,
    annee int UNIQUE,
    date_debut date
);

create table unite_oeuvre (
    id_unite_oeuvre serial primary key,
    nom varchar(20)
);

create table centre (
    id_centre serial primary key ,
    nom varchar(50),
    categorie int -- 1 direct , 0 indirect ;;;; 1 opérationnels , 0 structure
);

create table type_rubrique (
    id_type_rubrique serial PRIMARY KEY,
    libelle varchar(20),
    nature int, -- 1 variable, 0 fixe , supplétive(Karaman'i DG)
    incorporabilite int, -- 0 non incorporable, 1 incorporable
    id_unite_oeuvre int,
    foreign key (id_unite_oeuvre) references unite_oeuvre(id_unite_oeuvre)
);

create table imputation (
    id_imputation serial primary key,
    id_centre int,
    id_type_rubrique int,
    pourcentage decimal(5,2),
    foreign key (id_centre) references centre(id_centre),
    foreign key (id_type_rubrique) references type_rubrique(id_type_rubrique)
);

create table rubrique(
    id_rubrique serial PRIMARY KEY,
    id_type_rubrique int,
    prix_unitaire decimal(11, 2),
    quantite decimal(17,2),
    date_achat date,
    id_exercice int,
    foreign key (id_exercice) references exercice(id_exercice),
    foreign key (id_type_rubrique) references type_rubrique(id_type_rubrique)
);

create table produit(
    id_produit serial PRIMARY KEY ,
    libelle varchar(30),
    quantite decimal(11,2),
    id_centre int,
    id_exercice int,
    date_sortie date,
    id_unite_oeuvre int,
    foreign key (id_exercice) references exercice(id_exercice),
    foreign key (id_centre) references centre(id_centre),
    foreign key (id_unite_oeuvre) references unite_oeuvre(id_unite_oeuvre)
);


CREATE TABLE marchandise(
        id_marchandise serial primary key,
        nom varchar(50),
        id_unite_oeuvre int,
        foreign key (id_unite_oeuvre) references unite_oeuvre(id_unite_oeuvre)
);

create table produit_finit(
  id_produit_finit serial primary key,
  nom varchar(50)
);

create table mouvement_stock(
    id_mouvement_stock serial primary key,
    id_marchandise int,
    date_enregistrement date,
    quantite int,
    prix_unitaire decimal(11,2),
    nature int,
    foreign key (id_marchandise) references marchandise(id_marchandise)
);
-- 0 pour l'achat et 1 pour le vente

create table etat_stock(
   id_etat_stock serial primary key,
   id_marchandise int,
   date_enregistrement date,
   quantite int,
   prix_unitaire decimal(11,2),
   foreign key (id_marchandise) references marchandise(id_marchandise)
);

create table produit_marchandise(
    id_produit_marchandise serial primary key,
    id_produit_finit int,
    id_marchandise int,
    quantite int,
    foreign key (id_marchandise) references marchandise(id_marchandise),
    foreign key (id_produit_finit) references produit_finit(id_produit_finit)
);

CREATE TABLE besoin(
   id_besoin serial primary key,
   id_marchandise int,
   quantite decimal(10,2),
   id_demandeur int,
   etat int, -- 0: zero validation , 1: validé par depart. achat, 2: validé par DG & achat
   daty date,
   foreign key (id_demandeur) references centre(id_centre),
   foreign key (id_marchandise) references marchandise(id_marchandise)
);

CREATE TABLE fournisseur(
        id_fournisseur serial primary key,
        nom varchar(50),
        daty date,
        compte varchar(7)
);

CREATE TABLE client(
   id_client serial primary key,
   nom varchar(50),
   daty date,
   compte varchar(7)
);

CREATE TABLE proformat(
      id_proformat serial primary key,
      id_fournisseur int,
      id_client int,
      daty date,
      foreign key (id_fournisseur) references fournisseur(id_fournisseur),
    foreign key (id_client) references client(id_client)
);

CREATE TABLE proformat_fille(
    id_proformat_fille serial primary key,
    id_proformat int,
    id_produit int,
    id_marchandise int,
    prix decimal(18,2),
    foreign key (id_proformat) references proformat(id_proformat),
    foreign key (id_produit) references produit(id_produit),
    foreign key (id_marchandise) references marchandise(id_marchandise)
);

create table bon_commande(
         id_bc serial primary key ,
         id_proformat int,
         id_fournisseur int,
         id_client int,
         etat int,
         date_commande date,
         date_livraison date,
         foreign key (id_fournisseur) references fournisseur(id_fournisseur),
         foreign key (id_client) references  client(id_client),
         foreign key (id_proformat) references proformat(id_proformat)
);

create table bon_commande_fille(
       id_bc_fille serial primary key ,
       id_bc int,
       id_marchandise int,
       prix decimal(18,2),
       quantite decimal(10,2),
       foreign key (id_bc) references bon_commande(id_bc),
       foreign key (id_marchandise) references marchandise(id_marchandise)
);

create table bon_reception(
      id_br serial primary key ,
      id_bc int,
      date_reception date,
      foreign key (id_bc) references bon_commande(id_bc)
);

create table bon_reception_fille(
        id_br_fille serial primary key,
        id_br int,
        id_marchandise int,
        quantite decimal(10,2),
        prix decimal(18,2),
        foreign key (id_br) references bon_reception(id_br),
        foreign key (id_marchandise) references marchandise(id_marchandise)
);

create table facture(
    id_facture serial primary key,
    id_bc int,
    id_br int,
    date_facture date,
    id_fournisseur int,
    id_client int,
    foreign key (id_bc) references bon_commande(id_bc),
    foreign key (id_br) references bon_reception(id_br),
    foreign key (id_fournisseur) references fournisseur(id_fournisseur),
    foreign key (id_client) references client(id_client)
);

create table facture_fille(
      id_facture_fille serial primary key ,
      id_facture int,
      id_marchandise int,
      quantite numeric(10,2),
      prix numeric(18,2),
      foreign key (id_facture) references facture(id_facture),
      foreign key (id_marchandise) references marchandise(id_marchandise)
);

create or replace function check_percentage()
returns trigger as $$
DECLARE
    total decimal(5,2);
BEGIN
    select coalesce(sum(pourcentage), 0)
    into
        total
    from
        imputation
    where
        id_type_rubrique = NEW.id_type_rubrique;
    IF total + NEW.pourcentage > 100
    THEN
        RAISE EXCEPTION 'Total pourcentage depasse les 100%', NEW.id_rubrique;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

create trigger verify before INSERT ON imputation for each row execute function check_percentage();

-- View
create or replace view liste_general AS
SELECT
    row_number() over () as id,
    r.id_exercice as id_exeercice,
    tr.libelle as libelle,
    tr.id_type_rubrique as id_type_rubrique,
    SUM(r.prix_unitaire * r.quantite) AS total_rubrique,
    tr.incorporabilite as incorporabilite
FROM
    rubrique r
JOIN
    type_rubrique tr ON r.id_type_rubrique = tr.id_type_rubrique
GROUP BY
    r.id_exercice, tr.libelle, tr.id_type_rubrique;

create or replace view list_analytique as
select
    row_number() over () as id,
    lg.id_type_rubrique as id_type_rubrique,
    imputation.pourcentage,
    imputation.id_centre,
    (lg.total_rubrique/100)*imputation.pourcentage as total_par_centre,
    lg.incorporabilite as incorporabilite
from
    imputation
        join
    liste_general lg on imputation.id_type_rubrique = lg.id_type_rubrique
group by imputation.id_centre, imputation.pourcentage, lg.id_type_rubrique, lg.total_rubrique, lg.incorporabilite;


create or replace view analyse_ensemble AS
select rubrique.*, type_rubrique.nature, type_rubrique.incorporabilite,
       imputation.id_imputation,imputation.pourcentage,
       centre.*, (rubrique.prix_unitaire * rubrique.quantite) as montant ,
       (rubrique.prix_unitaire * rubrique.quantite)*(imputation.pourcentage/100) as reel
from  rubrique
          join type_rubrique on rubrique.id_type_rubrique = type_rubrique.id_type_rubrique
          join imputation on rubrique.id_type_rubrique = imputation.id_type_rubrique
          join centre on imputation.id_centre=centre.id_centre;


create or replace view v_repartition as
select row_number() over ()
        ,by_centre.*, round((montant*100)/operationnel,2) as cle,
       structure*round((montant*100)/operationnel,2)/100 as structure,
       (by_centre.montant + structure*round((montant*100)/operationnel,2)/100) as cout_total
from
    (select id_centre,id_exercice,nom,sum(reel) as montant,categorie
     from analyse_ensemble GROUP BY id_centre,id_exercice,categorie, nom having categorie=1) as by_centre
        join (select sum(reel) as operationnel from analyse_ensemble where categorie=1) as operationnel on True
        join (select sum(reel) as structure from analyse_ensemble where categorie=0) as structure on True
;

create or replace view v_repartition_total as
select row_number() over () as id, id_exercice,
        sum(montant) as s_direct,
       sum(structure) as s_structure ,
       sum(cout_total) as s_cout_total
from v_repartition group by id_exercice;


create or replace view v_variable_fixe as
select row_number() over (),
    rubrique.id_exercice, type_rubrique.nature, sum(prix_unitaire*quantite) as valeur from rubrique
join type_rubrique on rubrique.id_type_rubrique = type_rubrique.id_type_rubrique
group by rubrique.id_exercice, type_rubrique.nature;


-- test behhh
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
    (default, 'Bois', 4),
    (default, 'Vis', 5),
    (default, 'Metal', 5);

INSERT INTO produit_marchandise (id_produit_finit, id_marchandise, quantite) VALUES
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

ALTER TABLE proformat_fille ADD COLUMN QTE NUMERIC(15,2);
group by rubrique.id_exercice, type_rubrique.nature;


