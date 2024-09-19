create database mr_meuble;

\c mr_meuble

create sequence seq_centre;
create sequence seq_rubrique;
create sequence seq_imputation;
create sequence seq_unite_oeuvre;

create table centre (
    id_centre varchar(20) primary key default 'CENTRE'||nextval('seq_centre'),
    nom varchar(50),
    categorie int -- 1 direct , 0 indirect
);

create table unite_oeuvre (
    id_unite_oeuvre varchar(20) primary key default 'UNITE'||nextval('seq_unite_oeuvre'),
    nom varchar(20)
);

create table rubrique (
    id_rubrique varchar(20) PRIMARY KEY DEFAULT 'RUBRIQUE'||nextval('seq_rubrique'),
    libelle varchar(20),
    nature int, -- 1 variable, 0 fixe
    id_unite_oeuvre varchar(20),
    montant decimal(11, 2),
    foreign key (id_unite_oeuvre) references ue(id_unite_oeuvre)
);

create table imputation (
    id_imputation varchar(20) primary key default 'IMPUTATION'||nextval('seq_imputation'),
    id_centre varchar(20),
    id_rubrique varchar(20),
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
        id_rubrique = NEW.idRubrique;
    IF total + NEW.pourcentage > 100
    THEN
        RAISE EXCEPTION 'Total pourcentage depasse les 100%', NEW.id_rubrique;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

create trigger verify before INSERT ON imputation for each row execute function check_percentage();

-- test behhh
INSERT INTO centre (nom, categorie) VALUES ('ADM/DIST', 0);
INSERT INTO centre (nom, categorie) VALUES ('USINE', 1);
INSERT INTO centre (nom, categorie) VALUES ('ATELIER', 1);

INSERT INTO unite_oeuvre(nom) VALUES ('KG');  

INSERT INTO rubrique (libelle, nature, id_unite_oeuvre, montant) VALUES ('ACHAT SEMANCE', 1, 'UE1', 4235.1);

INSERT INTO imputation (id_centre, id_rubrique, pourcentage) VALUES ('CENTRE2', 'RUBRIQUE1', 90);
INSERT INTO imputation (id_centre, id_rubrique, pourcentage) VALUES ('CENTRE3', 'RUBRIQUE1', 11);