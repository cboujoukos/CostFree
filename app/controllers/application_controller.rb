class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end

 private

  def require_login
    unless signed_in?
      flash[:error] = "You must be logged in to view this page"
      redirect_to new_user_session_path
    end
  end

end
