class User < ActiveRecord::Base
 acts_as_voter
 def self.omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.image = auth.info.image
      user.token = auth.credentials.token
      #user.expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
