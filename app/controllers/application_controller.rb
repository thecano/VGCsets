class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale, :ensure_subdomain
  helper_method :current_user

def set_locale
  I18n.locale = extract_locale_from_subdomain || session[:locale] || I18n.default_locale
  session[:locale] = I18n.locale 
end


# Get locale code from request subdomain (like http://it.application.local:3000)
# You have to put something like:
#   127.0.0.1 gr.application.local
# in your /etc/hosts file to try this out locally
def extract_locale_from_subdomain
  parsed_locale = request.subdomains.first
  I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
end

def ensure_subdomain
    if request.subdomain==""
	logger.debug "entra el if vacio"      
	redirect_to ("http://"+I18n.locale.to_s+"."+"vgcsets.com"+request.path)      
    elsif request.subdomain == "www"
	logger.debug "la url es"
	logger.debug request.url
	redirect_to ("http://"+I18n.locale.to_s+"."+"vgcsets.com"+request.path)
	
	  #redirect_to request.url.sub("www","")
    #else 
    #  redirect_to "http://www.rubyonrails.org"
    end
end

private

def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
end



end
