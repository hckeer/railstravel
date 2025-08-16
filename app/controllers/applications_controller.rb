# app/controllers/applications_controller.rb
class ApplicationsController < ApplicationController
  before_action :require_login

  def create
    @post = Post.find(params[:post_id])
    if current_client && !current_client.applied_posts.include?(@post)
      @application = @post.applications.create(client: current_client, status: 'pending')
      redirect_to posts_path, notice: 'Application submitted successfully!'
    else
      redirect_to posts_path, alert: 'Unable to submit application'
    end
  end

  def index
    if current_organization
      @applications = current_organization.applications.includes(:client, :post)
    else
      redirect_to root_path, alert: 'Not authorized'
    end
  end

  private

  def current_client
    current_user.is_a?(Client) ? current_user : nil
  end

  def current_organization
    current_user.is_a?(Organization) ? current_user : nil
  end
end