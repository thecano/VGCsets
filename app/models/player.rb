class Player < ActiveRecord::Base
  def to_param
    [id, nickname.parameterize].join("-")
  end
  belongs_to :user, :foreign_key = "author"
end
