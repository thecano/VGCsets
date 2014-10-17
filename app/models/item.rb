class Item < ActiveRecord::Base
	self.table_name="items"
	has_many :pokemonsets
end
