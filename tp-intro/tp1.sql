-- MABD TP1 SQL avec la base MONDIAL


-- -------------------- binome -------------------------
-- NOM
-- Prenom

-- NOM
-- Prenom
-- -----------------------------------------------------

-- pour se connecter à oracle:
-- sqlplus E1234567/E1234567@oracle
-- remplacer E12345657 par la lettre E suivie de votre numéro de login
@mondial_synonym


set sqlbl on
set linesize 150

prompt schema de la table Country
desc Country

prompt schema de la table City
desc City

prompt schema de la table IsMember
desc IsMember

prompt schema de la table City
desc City

-- pour afficher un nuplet entier sur une seule ligne
column name format A15
column capital format A15
column province format A20

-- Requete 0

select * from Country where name = 'France';

-- Requete 10
select o.name, count(*) as nbMembre, sum(c.population)
from organization o, country c, isMember m
where m.organization = o.abbreviation and m.country = c.code
group by o.abbreviation, o.name;


-- Requete 11
select o.name, count(*) as nbMembre, sum(c.population)
from organization o, country c, isMember m
where m.organization = o.abbreviation and m.country = c.code
group by o.abbreviation, o.name
having count(*) > 100;


-- Requete 12
select c.name, m.name
from country c, mountain m, geo_mountain g, encompasses e
where e.continent='America' and e.country = c.code and g.mountain = m.name and g.country=c.code
      and not exists(	    select *
      	      		    from geo_mountain g2, mountain m2
			    where m2.name != m.name and m2.name=g2.mountain and g2.country=c.code and m2.height > m.height);

-- requete 13
select r.name
from river r
where r.river='Nile';

-- requete 14
select r.name
from river r
where r.river in (select r.name
from river r
where r.river='Nile') or r.river = 'Nile';

select distinct r1.name
from river r1, river r2
where r1.river = 'Nile' or (r1.river = r2.name and r2.river='Nile');

-- requete 15
select sum(r.length)
from river r
where r.river in (select r.name
from river r
where r.river='Nile') or r.river = 'Nile' or r.name='Nile';

-- requete 16a
select *
from (select o.name, count(*) as cpt
     from organization o , ismember m
     where o.abbreviation = m.organization
     group by o.abbreviation, o.name
     order by cpt DESC)
where rownum<2;

-- requete 16b
select *
from (select o.name, count(*) as cpt
     from organization o , ismember m
     where o.abbreviation = m.organization
     group by o.abbreviation, o.name
     order by cpt DESC)
where rownum<4;

--requete 17
select sum(population)/sum(area)
from (select distinct v.name, v.Area, v.population
       from country c, country v, borders b
       where ((c.name = 'Algeria' or c.name = 'Libya')
      and ((b.country1=c.code and b.country2=v.code) or (b.country2=c.code and b.country1=v.code)))
      or v.name= 'Algeria' or v.name='Libya');


select name
from country;

select * from country where name='France';
