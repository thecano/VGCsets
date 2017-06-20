Rails.application.config.middleware.use OmniAuth::Builder do
 		provider :facebook, Rails.application.secrets.facebook_key, Rails.application.secrets.facebook_secret,
    client_options: {
      site: 'https://graph.facebook.com/v2.9',
      authorize_url: "https://www.facebook.com/v2.9/dialog/oauth"
    },
    token_params: {
      parse: :json
    }
 		provider :twitter, Rails.application.secrets.twitter_key, Rails.application.secrets.twitter_secret
      
end