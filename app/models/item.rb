class Item < ActiveRecord::Base
	self.table_name="item_names"
	self.primary_key = 'item_id'
end
