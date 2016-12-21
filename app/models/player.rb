class Player < ActiveRecord::Base
  def to_param
    [id, nickname.parameterize].join("-")
  end
end
