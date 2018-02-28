class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

 private

  def require_login
    unless signed_in?
      flash[:error] = "You must be logged in to view this page"
      redirect_to new_user_session_path
    end
  end

end
