class SessionsController < ApplicationController

    def home
    end

    def destroy
        session.clear
        redirect_to root_path
    end

    def create
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else 
            flash[:message] = "Incorrect credentials, please try again"
            redirect_to "/login"
        end
    end

    def google
        #find or create a user using the attributes auth
        user = User.find_or_create_by(username: auth['info']['nickname']) do |u|
            u.username = auth['info']['nickname']
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