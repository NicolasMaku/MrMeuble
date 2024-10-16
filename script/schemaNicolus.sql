CREATE TABLE marchandise(
    id_marchandise serial primary key,
    nom varchar(50),
    id_unite_oeuvre int,
    foreign key (id_unite_oeuvre) references unite_oeuvre(id_unite_oeuvre)
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
    foreign key (id_fournisseur) references fournisseur(id_fournisseur)
);

CREATE TABLE proformat_fille(
    id_proformat_fille serial primary key,
    id_proformat int,
    id_produit int,
    prix decimal(18,2)
);

create table bon_commande(
    id_bc serial primary key ,
    id_proformat int,
    id_fournisseur int,
    id_client int,
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
    date_facture int,
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