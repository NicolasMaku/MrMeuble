create database mr_meuble;

\c mr_meuble

create table exercice(
    id_exercice serial PRIMARY KEY,
    annee int UNIQUE,
    date_debut date
);

create table centre (
    id_centre serial primary key ,
    nom varchar(50),
    categorie int -- 1 direct , 0 indirect ;;;; 1 opérationnels , 0 structure
);

create table unite_oeuvre (
    id_unite_oeuvre serial primary key,
    nom varchar(20)
);

create table type_rubrique (
    id_type_rubrique serial PRIMARY KEY,
    libelle varchar(20),
    nature int, -- 1 variable, 0 fixe , supplétive(Karaman'i DG)
    incorporabilite int, -- 0 non incorporable, 1 incorporable
    id_unite_oeuvre int,
    id_exercice int,
    foreign key (id_exercice) references exercice(id_exercice),
    foreign key (id_unite_oeuvre) references unite_oeuvre(id_unite_oeuvre)
);

create table imputation (
    id_imputation serial primary key,
    id_centre int,
    id_type_rubrique int,
    pourcentage decimal(5,2),
    id_exercice int,
    foreign key (id_centre) references centre(id_centre),
    foreign key (id_type_rubrique) references type_rubrique(id_type_rubrique)
);

create table rubrique(
    id_rubrique serial PRIMARY KEY,
    id_type_rubrique int,
    prix_unitaire decimal(11, 2),
    quantite decimal(17,2),
    foreign key (id_type_rubrique) references type_rubrique(id_type_rubrique)
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

create or replace view analyse_ensemble AS
select rubrique.*,imputation.id_imputation,imputation.pourcentage,centre.*, (rubrique.prix_unitaire * rubrique.quantite)*(imputation.pourcentage/100) as reel
from  rubrique join imputation on rubrique.id_rubrique = imputation.id_rubrique
join centre on imputation.id_centre=centre.id_centre;

select id_centre, nom,sum(reel) from analyse_ensemble GROUP BY id_centre, nom; 


-- test behhh
INSERT INTO exercice( annee ,date_debut) VALUES (2024, '01/01/2024');

INSERT INTO centre (nom, categorie) VALUES ('ADM/DIST', 0);
INSERT INTO centre (nom, categorie) VALUES ('USINE', 1);
INSERT INTO centre (nom, categorie) VALUES ('ATELIER', 1);

INSERT INTO unite_oeuvre(nom) VALUES 
('KG'),  
('Kwh'),  
('L');  

INSERT INTO type_rubrique (libelle, nature, incorporabilite, id_unite_oeuvre, id_exercice) VALUES ('ACHAT SEMANCE', 1, 0, 1, 1);
INSERT INTO type_rubrique (libelle, nature, incorporabilite, id_unite_oeuvre, id_exercice) VALUES ('ACHAT BOIS', 1, 1, 1, 1);

INSERT INTO imputation (id_centre, id_type_rubrique, pourcentage) VALUES (2, 1, 90);
INSERT INTO imputation (id_centre, id_type_rubrique, pourcentage) VALUES (3, 1, 10);
INSERT INTO imputation (id_centre, id_type_rubrique, pourcentage) VALUES (2, 2, 50);
INSERT INTO imputation (id_centre, id_type_rubrique, pourcentage) VALUES (3, 2, 50);