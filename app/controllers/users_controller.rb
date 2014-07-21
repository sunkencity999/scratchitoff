class UsersController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json

  def edit
    @user = current_user
  end

  def update_password
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
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information updated"
      redirect_to edit_user_registration_path(current_user)
    else
      render "devise/registrations/edit"
    end
  end
 
   private
 
   def user_params
     params.require(:user).permit(:name, :password, :current_password, :password_confirmation)
   end
 end
