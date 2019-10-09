-- compléter l'entête 
-- ==================

-- NOM    : Jouve	
-- Prénom : Vincent	

-- NOM    : Cadiou
-- Prénom : Antoine

-- Groupe : 3
-- binome :

-- ================================================

set sqlbl on


-- nettoyer le compte
@vider

-- Définition des types de données

create type matiere as object(
       nom varchar2(20),
       prixkilo number(5,2),
       massevolumique number(5,2)
);
@compile

create type dimensions as Table of Number(3);
@compile

create type Piece as Object(nom varchar2(30)) not final;
@compile

create type Forme as Object(nom varchar2(30)) not final;
@compile

create type fCylindre under Forme(
       rayon Number(3),
       hauteur Number(3)
)
@compile

create type fCube under Forme(
       longueur Number(3)
)
@compile

create type fSphere under Forme(
       rayon Number(3)
)
@compile

create type fParall under Forme(
       longueur Number(3),
       largeur Number(3),
       hauteur Number(3)
)
@compile

--on pourrait faire une piececube qui herite de piece de base
create type pBase under Piece(
    f Forme,
    faiten ref matiere
);
@compile

create type ensPiece as table of ref Piece;
@compile

-- ajouter la quantité dans un autre type 
create type pComposite under Piece(
       composants ensPiece,
       cout Number(5)
);
@compile


-- liste de tous les types créés
@liste
