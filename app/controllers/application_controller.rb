class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  # This allows the program to respond to JSON and HTML requests
  respond_to :json
  respond_to :html
 

  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # unauthorized users will redirect to the homepage, and receive an error message. 

  rescue_from Pundit::NotAuthorizedError do |exception|
    redirect_to root_url, alert: exception.message
  end


  def after_sign_in_path_for(resource)
    # direct logged in users to welcome page
  welcome_index_path
end

    protected

  def configure_permitted_parameters
    # allows us to filter parameters using strong parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
end
