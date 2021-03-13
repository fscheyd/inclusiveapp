class SessionsController < ApplicationController

    def home
    end

    def new
    end

    def create
        user = User.find_by_username(params[:username])
        if user && user.authenticate(params[:password]) # authenticate method comes from has_secure_password
          session[:user_id] = user.id # logs in a user
          redirect_to user_path(user)
        else
          flash[:message] = "Invalid credentials, please try again!"
          redirect_to '/login'
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