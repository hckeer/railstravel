# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  private

  def current_user
    if session[:organization_id]
      @current_user ||= Organization.find_by(id: session[:organization_id])
    elsif session[:client_id]
      @current_user ||= Client.find_by(id: session[:client_id])
    end
  end

  def logged_in?
    current_user.present?
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_path
    end
  end
end