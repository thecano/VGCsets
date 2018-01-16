class Top < ActiveRecord::Base
alias_attribute :user_id, :author
belongs_to :user
end
