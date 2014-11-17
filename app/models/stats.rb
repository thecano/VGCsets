class Stats < ActiveRecord::Base
self.table_name="pokemon_stats"
	self.primary_key = 'pokemon_id'
end
