-- compl�ter l'ent�te 
-- ==================

-- NOM    : Jouve
-- Pr�nom : Vincent

-- NOM    : Cadiou
-- Pr�nom : Antoine

-- Groupe : 3
-- binome :

-- ================================================

-- stockage des donn�es : d�finition des relations
-- ====================

create table LesMatieres of Matiere;

create table LesPBases of pBase;

create table LesPComposites of pComposite
nested table composants store as X_composants;

-- instanciation des objets
-- ========================

insert into LesMatieres values ('Bois',10,2);

insert into LesMatieres values ('fer',5,3);

insert into LesMatieres values ('ferrite',6,10);

-- CREATE PROCEDURE insere_piece_de_base;

select * from LesMatieres;
