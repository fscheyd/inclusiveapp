class UsersController < ApplicationController
  def index
    @user = User.all
  end
  
  def show
    @user = User.find(params[:ID])
  end
  
  def new
    @user = User.new
  end
    
  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user.id)
      else
        flash[:error] = "Something went wrong."
        render :new
      end
      
  end
      
  

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  
end
