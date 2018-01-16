class Player < ActiveRecord::Base
  def to_param
    [id, nickname.parameterize].join("-")
  end
  alias_attribute :user_id, :author
  belongs_to :user
end
