create database mr_meuble;

\c mr_meuble

create table centre (
    id_centre serial primary key ,
    nom varchar(50),
    categorie int -- 1 direct , 0 indirect
);

create table unite_oeuvre (
    id_unite_oeuvre serial primary key ,
    nom varchar(20)
);

create table rubrique (
    id_rubrique serial PRIMARY KEY,
    libelle varchar(20),
    nature int, -- 1 variable, 0 fixe
    id_unite_oeuvre int,
    montant decimal(11, 2),
    foreign key (id_unite_oeuvre) references unite_oeuvre(id_unite_oeuvre)
);

create table imputation (
    id_imputation serial primary key,
    id_centre int,
    id_rubrique int,
    pourcentage decimal(5,2),
    foreign key (id_centre) references centre(id_centre),
    foreign key (id_rubrique) references rubrique(id_rubrique)
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
        id_rubrique = NEW.id_rubrique;
    IF total + NEW.pourcentage > 100
    THEN
        RAISE EXCEPTION 'Total pourcentage depasse les 100%', NEW.id_rubrique;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

create trigger verify before INSERT ON imputation for each row execute function check_percentage();

-- View

create or replace view ensemble AS
select *, rubrique.montant*(imputation.pourcentage/100) as reel from  rubrique join imputation on rubrique.id_rubrique = imputation.id_rubrique;



-- test behhh
INSERT INTO centre (nom, categorie) VALUES ('ADM/DIST', 0);
INSERT INTO centre (nom, categorie) VALUES ('USINE', 1);
INSERT INTO centre (nom, categorie) VALUES ('ATELIER', 1);

INSERT INTO unite_oeuvre(nom) VALUES ('KG');  

INSERT INTO rubrique (libelle, nature, id_unite_oeuvre, montant) VALUES ('ACHAT SEMANCE', 1, 1, 4235.1);
INSERT INTO rubrique (libelle, nature, id_unite_oeuvre, montant) VALUES ('ACHAT BOIS', 1, 1, 20000);

INSERT INTO imputation (id_centre, id_rubrique, pourcentage) VALUES (2, 1, 90);
INSERT INTO imputation (id_centre, id_rubrique, pourcentage) VALUES (3, 1, 10);
INSERT INTO imputation (id_centre, id_rubrique, pourcentage) VALUES (2, 2, 50);
INSERT INTO imputation (id_centre, id_rubrique, pourcentage) VALUES (3, 2, 50);