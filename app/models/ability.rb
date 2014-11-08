class Ability < ActiveRecord::Base
self.table_name="ability_names"
	self.primary_key = 'ability_id'
end
