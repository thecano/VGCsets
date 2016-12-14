class Team < ActiveRecord::Base
belongs_to :player
has_one :top
end
