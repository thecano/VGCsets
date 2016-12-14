class Player < ActiveRecord::Base
has_many :teams
has_many :top8
end
