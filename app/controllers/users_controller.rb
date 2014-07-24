class UsersController < ApplicationController
  #authenticates user as first action, responds to JSON to interact with API's
  before_filter :authenticate_user!
  respond_to :json

  def edit
    #defines the user as the current logged-in user. 
    @user = current_user
  end

  def update_password
    #finds current user by their id, updates using devise .update_with_password() method
    # redirects to previous page. 
    @user = User.find(current_user.id)
    if @user.update_with_password(user_params)

      sign_in @user, :bypass => true
      redirect_to root_path 
    else
      render "edit"
    end
  end
 
  def show
    @user = User.find(params[:id])
    
  end

  def update
    # if the user data is update notice is flashed, and then redirects user to edit page. 
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information updated"
      redirect_to edit_user_registration_path(current_user)
    else
      render "devise/registrations/edit"
    end
  end
 
   private
    # private method to keep things RESTful and not repeat code. 
   def user_params
     params.require(:user).permit(:name, :password, :current_password, :password_confirmation)
   end
 end
