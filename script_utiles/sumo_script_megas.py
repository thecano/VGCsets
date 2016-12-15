id=835
f = open('megas', 'r')
for lines in f:
  print 'INSERT INTO pokemon_species_names (pokemon_species_id,local_language_id,name) VALUES('+str(id)+',7,"'+lines.strip('\n\r')+'-mega");'
  print 'INSERT INTO pokemon_species_names (pokemon_species_id,local_language_id,name) VALUES('+str(id)+',9,"'+lines.strip('\n\r')+'-mega");'
  id+=1

