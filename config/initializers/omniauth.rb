Rails.application.config.middleware.use OmniAuth::Builder do
 		provider :facebook, ENV['facebook_key'], ENV['facebook_secret'],
    client_options: {
      site: 'https://graph.facebook.com/v2.9',
      authorize_url: "https://www.facebook.com/v2.9/dialog/oauth"
    },
   callback_url: 'https://en.vgcsets.com/auth/facebook/callback',
 		provider :twitter, ENV['twitter_key'], ENV['twitter_secret']
      
end
