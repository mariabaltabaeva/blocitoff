class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  #, except: [:index, :show, :about]

  #def after_sign_in_path_for(resource_or_scope)
    #user_path(current_user)
  #end

end
