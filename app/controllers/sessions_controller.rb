class SessionsController < ApplicationController
  def new
    # Renders the login form
  end

  def create
    # Try to find as organization first
    organization = Organization.find_by(email: params[:email], password: params[:password])
    
    if organization
      session[:organization_id] = organization.id
      redirect_to root_path, notice: "Logged in successfully as organization"
    else
      # Try to find as client
      client = Client.find_by(email: params[:email], password: params[:password])
      
      if client
        session[:client_id] = client.id
        redirect_to root_path, notice: "Logged in successfully as client"
      else
        flash.now[:alert] = "Invalid email or password"
        render :new
      end
    end
  end

  def destroy
    session[:organization_id] = nil
    session[:client_id] = nil
    redirect_to root_path, notice: "Logged out successfully"
  end
end