RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end


 

end

RailsAdmin.authenticate_with{
  unless current_user
    session[:return_to] = request.url
    redirect_to login_url, :alert => "You must first log in or sign up before accessing this page."
  end
}

RailsAdmin.authorize_with{
  redirect_to root_path, :alert => "You are not authorized to access that page" unless current_user.admin?
}