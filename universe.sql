codeally@4a76b4af4abf:~/project$ psql --username=freecodecamp --dbname=postgres
Border style is 2.
Pager usage is off.
psql (12.9 (Ubuntu 12.9-2.pgdg20.04+1))
Type "help" for help.

postgres=> \d
Did not find any relations.

postgres=> create database universe;
CREATE DATABASE

Previous connection kept
postgres=> \c universe
You are now connected to database "universe" as user "freecodecamp".
universe=> create table galaxy;
ERROR:  syntax error at or near ";"
LINE 1: create table galaxy;
                           ^
universe=> create table galaxy();
CREATE TABLE
universe=> create table star();
CREATE TABLE
universe=> create table planet();
CREATE TABLE
universe=> create table moon();
CREATE TABLE
universe=> create table planet_type();
CREATE TABLE
universe=> \d
               List of relations
+--------+-------------+-------+--------------+
| Schema |    Name     | Type  |    Owner     |
+--------+-------------+-------+--------------+
| public | galaxy      | table | freecodecamp |
| public | moon        | table | freecodecamp |
| public | planet      | table | freecodecamp |
| public | planet_type | table | freecodecamp |
| public | star        | table | freecodecamp |
+--------+-------------+-------+--------------+
(5 rows)

universe=> alter table galaxy add column galaxy_id serial;
ALTER TABLE
universe=> alter table galaxy add constraint galaxy_id primary key(galaxy_id);
ALTER TABLE
universe=> alter table star add column star_id serial;
ALTER TABLE
universe=> alter table planet add column planet_id serial;
ALTER TABLE
universe=> alter table moon add column moon_id serial;
ALTER TABLE
universe=> alter table planet_types add column planet_types_id serial;
ERROR:  relation "planet_types" does not exist
universe=> alter table planet_type add column planet_type_id serial;
ALTER TABLE
universe=> alter table star add constraint star_id primary key(star_id);
ALTER TABLE
universe=> alter table planet add constraint planet_id primary key(planet_id);
ALTER TABLE
universe=> alter table moon add constraint moon_id primary key(moon_id);
ALTER TABLE
universe=> alter table planet_type add constraint planet_type_id primary key(planet_type_id);
ALTER TABLE
universe=> alter table galaxy add column name varchar(30) unique;
ALTER TABLE
universe=> alter table star add column name varchar(30) unique;
ALTER TABLE
universe=> alter table planet add column name varchar(30) unique;
ALTER TABLE
universe=> alter table moon add column name varchar(30) unique;
ALTER TABLE
universe=> alter table planet_type add column name varchar(30) unique;
ALTER TABLE
universe=> alter table galaxy add column diameter int;
ALTER TABLE
universe=> alter table star add column diameter int;
ALTER TABLE
universe=> alter table planet add column diameter int;
ALTER TABLE
universe=> alter table moon add column diameter int;
ALTER TABLE
universe=> alter table planet_type add column diameter int;
ALTER TABLE
universe=> alter table galaxy add column weight numeric(4,1) not null;
ALTER TABLE
universe=> alter table star add column weight numeric(4,1) not null;
ALTER TABLE
universe=> alter table planet add column weight numeric(4,1) not null;
ALTER TABLE
universe=> alter table moon add column weight numeric(4,1) not null;
ALTER TABLE
universe=> alter table planet_type add column weight numeric(4,1) not null;
ALTER TABLE
universe=> alter table galaxy add column description text;
ALTER TABLE
universe=> alter table star add column description text;
ALTER TABLE
universe=> alter table planet add column description text;
ALTER TABLE
universe=> alter table moon add column description text;
ALTER TABLE
universe=> alter table planet_type add column description text;
ALTER TABLE
universe=> alter table galaxy add column visible boolean not null;
ALTER TABLE
universe=> alter table star add column visible boolean not null;
ALTER TABLE
universe=> alter table planet add column visible boolean not null;
ALTER TABLE
universe=> alter table moon add column visible boolean not null;
ALTER TABLE
universe=> alter table planet_type add column visible boolean not null;
ALTER TABLE

universe=> alter table star add column galaxy_id int;
ALTER TABLE

universe=> alter table planet add column star_id int;
ALTER TABLE

universe=> alter table moon add column planet_id int;
ALTER TABLE


ALTER TABLE
universe=> alter table moon add constraint moon_planet_id_fkey foreign key(planet_id) references planet(planet_id);
ALTER TABLE
universe=> alter table planet add constraint planet_star_id_fkey foreign key(star_id) references star(star_id);
ALTER TABLE
universe=> alter table star add constraint star_galaxy_id_fkey foreign key(galaxy_id) rederences galaxy(galaxy_id);
ERROR:  syntax error at or near "rederences"
LINE 1: ...traint star_galaxy_id_fkey foreign key(galaxy_id) rederences...
                                                             ^
universe=> alter table star add constraint star_galaxy_id_fkey foreign key(galaxy_id) references galaxy(galaxy_id);
ALTER TABLE
universe=> select * from galaxy;
+-----------+------+----------+--------+-------------+---------+
| galaxy_id | name | diameter | weight | description | visible |
+-----------+------+----------+--------+-------------+---------+
+-----------+------+----------+--------+-------------+---------+
(0 rows)

universe=> insert into galaxy(name, diameter, weight, description, visible) values ('name1', 100, 100.1,'description1',TRUE);
INSERT 0 1
universe=> select * from galaxy;
+-----------+-------+----------+--------+--------------+---------+
| galaxy_id | name  | diameter | weight | description  | visible |
+-----------+-------+----------+--------+--------------+---------+
|         1 | name1 |      100 |  100.1 | description1 | t       |
+-----------+-------+----------+--------+--------------+---------+
(1 row)

universe=> insert into galaxy(name, diameter, weight, description, visible) values ('name2', 100, 100.1,'description2',TRUE);
INSERT 0 1
universe=> insert into galaxy(name, diameter, weight, description, visible) values ('name3', 100, 100.1,'description3',TRUE);
INSERT 0 1
universe=> insert into galaxy(name, diameter, weight, description, visible) values ('name4', 100, 100.1,'description4',TRUE);
INSERT 0 1
universe=> insert into galaxy(name, diameter, weight, description, visible) values ('name5', 100, 100.1,'description5',TRUE);
INSERT 0 1
universe=> insert into galaxy(name, diameter, weight, description, visible) values ('name6', 100, 100.1,'description6',TRUE);
INSERT 0 1
universe=> select * from galaxy;
+-----------+-------+----------+--------+--------------+---------+
| galaxy_id | name  | diameter | weight | description  | visible |
+-----------+-------+----------+--------+--------------+---------+
|         1 | name1 |      100 |  100.1 | description1 | t       |
|         2 | name2 |      100 |  100.1 | description2 | t       |
|         3 | name3 |      100 |  100.1 | description3 | t       |
|         4 | name4 |      100 |  100.1 | description4 | t       |
|         5 | name5 |      100 |  100.1 | description5 | t       |
|         6 | name6 |      100 |  100.1 | description6 | t       |
+-----------+-------+----------+--------+--------------+---------+
(6 rows)

universe=> select * from star;
+---------+------+----------+--------+-------------+---------+-----------+
| star_id | name | diameter | weight | description | visible | galaxy_id |
+---------+------+----------+--------+-------------+---------+-----------+
+---------+------+----------+--------+-------------+---------+-----------+
(0 rows)

universe=> ;
universe=> insert into star (name, diameter, weight, description, visible, galaxy_id) values ('name1', 100,100.1,'description1',TRUE,1);
INSERT 0 1
universe=> insert into star (name, diameter, weight, description, visible, galaxy_id) values ('name2', 100,100.1,'description2',TRUE,1);
INSERT 0 1
universe=> insert into star (name, diameter, weight, description, visible, galaxy_id) values ('name3', 100,100.1,'description3',TRUE,1);
INSERT 0 1
universe=> insert into star (name, diameter, weight, description, visible, galaxy_id) values ('name4', 100,100.1,'description4',TRUE,1);
INSERT 0 1
universe=> insert into star (name, diameter, weight, description, visible, galaxy_id) values ('name5', 100,100.1,'description5',TRUE,1);
INSERT 0 1
universe=> insert into star (name, diameter, weight, description, visible, galaxy_id) values ('name6', 100,100.1,'description6',TRUE,1);
INSERT 0 1
universe=> select * from star;
+---------+-------+----------+--------+--------------+---------+-----------+
| star_id | name  | diameter | weight | description  | visible | galaxy_id |
+---------+-------+----------+--------+--------------+---------+-----------+
|       1 | name1 |      100 |  100.1 | description1 | t       |         1 |
|       2 | name2 |      100 |  100.1 | description2 | t       |         1 |
|       3 | name3 |      100 |  100.1 | description3 | t       |         1 |
|       4 | name4 |      100 |  100.1 | description4 | t       |         1 |
|       5 | name5 |      100 |  100.1 | description5 | t       |         1 |
|       6 | name6 |      100 |  100.1 | description6 | t       |         1 |
+---------+-------+----------+--------+--------------+---------+-----------+
(6 rows)

universe=> select * from planet;
+-----------+------+----------+--------+-------------+---------+---------+
| planet_id | name | diameter | weight | description | visible | star_id |
+-----------+------+----------+--------+-------------+---------+---------+
+-----------+------+----------+--------+-------------+---------+---------+
(0 rows)

universe=> insert into planet (name, diameter, weight, description, visible, star_id) values ('name1', 100,100.1,'description1',TRUE,1);
INSERT 0 1
universe=> insert into planet (name, diameter, weight, description, visible, star_id) values ('name2', 100,100.1,'description2',TRUE,1);
INSERT 0 1
universe=> insert into planet (name, diameter, weight, description, visible, star_id) values ('name3', 100,100.1,'description3',TRUE,1);
INSERT 0 1
universe=> insert into planet (name, diameter, weight, description, visible, star_id) values ('name4', 100,100.1,'description4',TRUE,1);
INSERT 0 1
universe=> insert into planet (name, diameter, weight, description, visible, star_id) values ('name5', 100,100.1,'description5',TRUE,1);
INSERT 0 1
universe=> insert into planet (name, diameter, weight, description, visible, star_id) values ('name6', 100,100.1,'description6',TRUE,1);
INSERT 0 1
universe=> insert into planet (name, diameter, weight, description, visible, star_id) values ('name7', 100,100.1,'description7',TRUE,1);
INSERT 0 1
universe=> insert into planet (name, diameter, weight, description, visible, star_id) values ('name8', 100,100.1,'description8',TRUE,1);
INSERT 0 1
universe=> insert into planet (name, diameter, weight, description, visible, star_id) values ('name9', 100,100.1,'description9',TRUE,1);
INSERT 0 1
universe=> insert into planet (name, diameter, weight, description, visible, star_id) values ('name10', 100,100.1,'description10',TRUE,1);
INSERT 0 1
universe=> insert into planet (name, diameter, weight, description, visible, star_id) values ('name11', 100,100.1,'description11',TRUE,1);
INSERT 0 1
universe=> insert into planet (name, diameter, weight, description, visible, star_id) values ('name12', 100,100.1,'description12',TRUE,1);
INSERT 0 1
universe=> select * from planet;
+-----------+--------+----------+--------+---------------+---------+---------+
| planet_id |  name  | diameter | weight |  description  | visible | star_id |
+-----------+--------+----------+--------+---------------+---------+---------+
|         1 | name1  |      100 |  100.1 | description1  | t       |       1 |
|         2 | name2  |      100 |  100.1 | description2  | t       |       1 |
|         3 | name3  |      100 |  100.1 | description3  | t       |       1 |
|         4 | name4  |      100 |  100.1 | description4  | t       |       1 |
|         5 | name5  |      100 |  100.1 | description5  | t       |       1 |
|         6 | name6  |      100 |  100.1 | description6  | t       |       1 |
|         7 | name7  |      100 |  100.1 | description7  | t       |       1 |
|         8 | name8  |      100 |  100.1 | description8  | t       |       1 |
|         9 | name9  |      100 |  100.1 | description9  | t       |       1 |
|        10 | name10 |      100 |  100.1 | description10 | t       |       1 |
|        11 | name11 |      100 |  100.1 | description11 | t       |       1 |
|        12 | name12 |      100 |  100.1 | description12 | t       |       1 |
+-----------+--------+----------+--------+---------------+---------+---------+
(12 rows)

universe=> select * from moon;
+---------+------+----------+--------+-------------+---------+-----------+
| moon_id | name | diameter | weight | description | visible | planet_id |
+---------+------+----------+--------+-------------+---------+-----------+
+---------+------+----------+--------+-------------+---------+-----------+
(0 rows)

universe=> insert into moon (name, diameter, weight, description, visible, star_id) values ('name1', 100,100.1,'description1',TRUE,1);
ERROR:  column "star_id" of relation "moon" does not exist
LINE 1: ...on (name, diameter, weight, description, visible, star_id) v...
                                                             ^
universe=> insert into moon (name, diameter, weight, description, visible, planet_id) values ('name1', 100,100.1,'description1',TRUE,1);
INSERT 0 1
universe=> insert into moon (name, diameter, weight, description, visible, planet_id) values ('name2', 100,100.1,'description2',TRUE,1);
INSERT 0 1
universe=> insert into moon (name, diameter, weight, description, visible, planet_id) values ('name3', 100,100.1,'description3',TRUE,1);
INSERT 0 1
universe=> insert into moon (name, diameter, weight, description, visible, planet_id) values ('name4', 100,100.1,'description4',TRUE,1);
INSERT 0 1
universe=> insert into moon (name, diameter, weight, description, visible, planet_id) values ('name5', 100,100.1,'description5',TRUE,1);
INSERT 0 1
universe=> insert into moon (name, diameter, weight, description, visible, planet_id) values ('name6', 100,100.1,'description6',TRUE,1);
INSERT 0 1
universe=> insert into moon (name, diameter, weight, description, visible, planet_id) values ('name7', 100,100.1,'description7',TRUE,1);
INSERT 0 1
universe=> insert into moon (name, diameter, weight, description, visible, planet_id) values ('name8', 100,100.1,'description8',TRUE,1);
INSERT 0 1
universe=> insert into moon (name, diameter, weight, description, visible, planet_id) values ('name9', 100,100.1,'description9',TRUE,1);
INSERT 0 1
universe=> insert into moon (name, diameter, weight, description, visible, planet_id) values ('name10', 100,100.1,'description10',TRUE,1);
INSERT 0 1
universe=> insert into moon (name, diameter, weight, description, visible, planet_id) values ('name11', 100,100.1,'description11',TRUE,1);
INSERT 0 1
universe=> insert into moon (name, diameter, weight, description, visible, planet_id) values ('name12', 100,100.1,'description12',TRUE,1);
INSERT 0 1
universe=> insert into moon (name, diameter, weight, description, visible, planet_id) values ('name13', 100,100.1,'description13',TRUE,1);
INSERT 0 1
universe=> insert into moon (name, diameter, weight, description, visible, planet_id) values ('name14', 100,100.1,'description14',TRUE,1);
INSERT 0 1
universe=> insert into moon (name, diameter, weight, description, visible, planet_id) values ('name15', 100,100.1,'description15',TRUE,1);
INSERT 0 1
universe=> insert into moon (name, diameter, weight, description, visible, planet_id) values ('name16', 100,100.1,'description16',TRUE,1);
INSERT 0 1
universe=> insert into moon (name, diameter, weight, description, visible, planet_id) values ('name17', 100,100.1,'description17',TRUE,1);
INSERT 0 1
universe=> insert into moon (name, diameter, weight, description, visible, planet_id) values ('name18', 100,100.1,'description18',TRUE,1);
INSERT 0 1
universe=> insert into moon (name, diameter, weight, description, visible, planet_id) values ('name19', 100,100.1,'description19',TRUE,1);
INSERT 0 1
universe=> insert into moon (name, diameter, weight, description, visible, planet_id) values ('name20', 100,100.1,'description20',TRUE,1);
INSERT 0 1
universe=> select * from moon;
+---------+--------+----------+--------+---------------+---------+-----------+
| moon_id |  name  | diameter | weight |  description  | visible | planet_id |
+---------+--------+----------+--------+---------------+---------+-----------+
|       1 | name1  |      100 |  100.1 | description1  | t       |         1 |
|       2 | name2  |      100 |  100.1 | description2  | t       |         1 |
|       3 | name3  |      100 |  100.1 | description3  | t       |         1 |
|       4 | name4  |      100 |  100.1 | description4  | t       |         1 |
|       5 | name5  |      100 |  100.1 | description5  | t       |         1 |
|       6 | name6  |      100 |  100.1 | description6  | t       |         1 |
|       7 | name7  |      100 |  100.1 | description7  | t       |         1 |
|       8 | name8  |      100 |  100.1 | description8  | t       |         1 |
|       9 | name9  |      100 |  100.1 | description9  | t       |         1 |
|      10 | name10 |      100 |  100.1 | description10 | t       |         1 |
|      11 | name11 |      100 |  100.1 | description11 | t       |         1 |
|      12 | name12 |      100 |  100.1 | description12 | t       |         1 |
|      13 | name13 |      100 |  100.1 | description13 | t       |         1 |
|      14 | name14 |      100 |  100.1 | description14 | t       |         1 |
|      15 | name15 |      100 |  100.1 | description15 | t       |         1 |
|      16 | name16 |      100 |  100.1 | description16 | t       |         1 |
|      17 | name17 |      100 |  100.1 | description17 | t       |         1 |
|      18 | name18 |      100 |  100.1 | description18 | t       |         1 |
|      19 | name19 |      100 |  100.1 | description19 | t       |         1 |
|      20 | name20 |      100 |  100.1 | description20 | t       |         1 |
+---------+--------+----------+--------+---------------+---------+-----------+
(20 rows)

universe=> select * from planet_type;
+----------------+------+----------+--------+-------------+---------+
| planet_type_id | name | diameter | weight | description | visible |
+----------------+------+----------+--------+-------------+---------+
+----------------+------+----------+--------+-------------+---------+
(0 rows)

universe=> insert into planet_type (name, diameter, weight, description, visible) values ('name1', 100,100.1,'description1',TRUE,1);
ERROR:  INSERT has more expressions than target columns
LINE 1: ... visible) values ('name1', 100,100.1,'description1',TRUE,1);
                                                                    ^
universe=> insert into planet_type (name, diameter, weight, description, visible) values ('name1', 100,100.1,'description1',TRUE);
INSERT 0 1
universe=> insert into planet_type (name, diameter, weight, description, visible) values ('name2', 100,100.1,'description2',TRUE);
INSERT 0 1
universe=> insert into planet_type (name, diameter, weight, description, visible) values ('name3', 100,100.1,'description3',TRUE);
INSERT 0 1