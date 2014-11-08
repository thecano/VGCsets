class Move < ActiveRecord::Base
self.table_name="move_names"
	self.primary_key = 'move_id'
end
