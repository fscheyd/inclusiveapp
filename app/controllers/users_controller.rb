class UsersController < ApplicationController


  def new
    @user = User.new
  end
    
  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user_id
        redirect_to user_path(@user)
      else
        render :new
      end
      
  end

  def show
    @user = User.find_by_id(params[:id])
    redirect_to '/' if !@user
  end
      
  def omniauth
    user = User.create_from_omniauth(auth)
    if user.valid?
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:message] = "Invalid Entry, please try again!"
      redirect_to login_path
    end
end
  

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  
  def require_user_access
    user = User.find_by(id: params[:id])
    unless current_user == user
      flash[:error] = "Sorry, no can do."
      redirect_to user_path(user)
    end
  end
  
  def auth
    request.env['omniauth.auth']
  end

end
