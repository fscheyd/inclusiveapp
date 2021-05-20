class SessionsController < ApplicationController

    def home
        @user = User.new
    end

    def new
    end

    def create
        user = User.find_by_username(params[:user][:username])
        #byebug
        if user && user.authenticate(params[:user][:password])
          session[:user_id] = user.id
          redirect_to user_path(user)
        else
          render 'new'
        end
    end
    
    def destroy
        session.delete :name
        redirect_to login_path
    end

    def omniauth
        user = User.find_or_create_by(username: auth['info']['nickname']) do |u|
            u.username = auth['info']['nickname']
            u.email = auth['info']
            u.password = SecureRandom.hex(10)
        end

        if user.save
          session[:user_id] = user.id
          redirect_to user_path(user)
        else 
            flash[:message] = "Something went wrong, please try again!"
            redirect_to '/'
        end
    end

    private 

    def auth
        request.env['omniauth.auth']
    end
    

end