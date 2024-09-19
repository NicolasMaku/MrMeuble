create database mr_meuble;

\c mr_meuble

create sequence seq_centre;
create sequence seq_rubrique;
create sequence seq_imputation;
create sequence seq_unite_oeuvre;

create table centre (
    idCentre varchar(20) primary key default 'CENTRE'||nextval('seq_centre'),
    nom varchar(50),
    categorie int -- 1 direct , 0 indirect
);

create table unite_oeuvre (
    idUniteOeuvre varchar(20) primary key default 'UNITE'||nextval('seq_unite_oeuvre'),
    nom varchar(20)
);

create table rubrique (
    idRubrique varchar(20) PRIMARY KEY DEFAULT 'RUBRIQUE'||nextval('seq_rubrique'),
    libelle varchar(20),
    nature int, -- 1 variable, 0 fixe
    idUniteOeuvre varchar(20),
    montant decimal(11, 2),
    foreign key (idUniteOeuvre) references ue(idUniteOeuvre)
);

create table imputation (
    idImputation varchar(20) primary key default 'IMPUTATION'||nextval('seq_imputation'),
    idCentre varchar(20),
    idRubrique varchar(20),
    pourcentage decimal(5,2),
    foreign key (idCentre) references centre(idCentre),
    foreign key (idRubrique) references rubrique(idRubrique)
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
        idRubrique = NEW.idRubrique;
    IF total + NEW.pourcentage > 100
    THEN
        RAISE EXCEPTION 'Total pourcentage depasse les 100%', NEW.idRubrique;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

create trigger verify before INSERT ON imputation for each row execute function check_percentage();

-- test behhh
INSERT INTO centre (nom, categorie) VALUES ('ADM/DIST', 0);
INSERT INTO centre (nom, categorie) VALUES ('USINE', 1);
INSERT INTO centre (nom, categorie) VALUES ('ATELIER', 1);

INSERT INTO ue(nom) VALUES ('KG');  

INSERT INTO rubrique (libelle, nature, idUniteOeuvre, montant) VALUES ('ACHAT SEMANCE', 1, 'UE1', 4235.1);

INSERT INTO imputation (idCentre, idRubrique, pourcentage) VALUES ('CENTRE2', 'RUBRIQUE1', 90);
INSERT INTO imputation (idCentre, idRubrique, pourcentage) VALUES ('CENTRE3', 'RUBRIQUE1', 11);