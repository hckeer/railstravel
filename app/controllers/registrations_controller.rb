class RegistrationsController < ApplicationController
  def new
    @user_type = params[:type] || 'client'
  end

  def create
    if params[:type] == 'organization'
      @organization = Organization.new(organization_params)
      if @organization.save
        session[:organization_id] = @organization.id
        redirect_to root_path, notice: "Organization account created successfully!"
      else
        flash.now[:alert] = "Could not create organization account"
        render :new
      end
    else
      @client = Client.new(client_params)
      if @client.save
        session[:client_id] = @client.id
        redirect_to root_path, notice: "Client account created successfully!"
      else
        flash.now[:alert] = "Could not create client account"
        render :new
      end
    end
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :email, :password, :pan_card_number, :citizenship)
  end

  def client_params
    params.require(:client).permit(:name, :email, :password)
  end
end