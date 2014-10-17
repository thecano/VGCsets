class Item < ActiveRecord::Base
	self.table_name="item_names"
	has_many :pokemonsets
end
