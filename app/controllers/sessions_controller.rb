class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:home, :new, :create]

    def home
    end

    
    def new
    end

    def create
        @user = User.find_by_username(params[:user][:username])
        #byebug
        if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
            flash[:message] = "Invalid entry. Please try again!"
            render :new
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end

    


    def omniauth
        user = User.create_from_omniauth(auth)
        if user.valid?
            session[:user_id] = user.id
            redirect_to new_review_path
        else
            flash[:message] = user.errors.full_messages.join("")
            redirect_to reviews_path
        end
    end

    private 

    def auth
        request.env['omniauth.auth']
    end
    

end