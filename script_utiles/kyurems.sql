BEGIN;

INSERT INTO pokemon_species_names VALUES(730,7,"Kyurem-W","Boundary");
INSERT INTO pokemon_species_names VALUES(730,9,"Kyurem-W","Boundary");

INSERT INTO pokemon_species_names VALUES(731,7,"Kyurem-B","Boundary");
INSERT INTO pokemon_species_names VALUES(731,9,"Kyurem-B","Boundary");




INSERT INTO pokemon_stats VALUES(730,1,125,0);
INSERT INTO pokemon_stats VALUES(730,2,120,0);
INSERT INTO pokemon_stats VALUES(730,3,90,0);
INSERT INTO pokemon_stats VALUES(730,4,170,3);
INSERT INTO pokemon_stats VALUES(730,5,100,0);
INSERT INTO pokemon_stats VALUES(730,6,95,3);

INSERT INTO pokemon_stats VALUES(731,1,125,0);
INSERT INTO pokemon_stats VALUES(731,2,170,3);
INSERT INTO pokemon_stats VALUES(731,3,100,0);
INSERT INTO pokemon_stats VALUES(731,4,120,0);
INSERT INTO pokemon_stats VALUES(731,5,90,0);
INSERT INTO pokemon_stats VALUES(731,6,95,0);

COMMIT;
