class UsersController < ApplicationController
  def new
    @user = User.new
  end
    
  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user.id)
      else
        render :new
      end
      
  end
      
  def show
    redirect_if_not_logged_in
    @user = current_user
    @reviews = current_user.reviews
  end

  private

  def user_params
    params.require(:user).permit(:user, :email, :password)
  end
  
end
