class SessionsController < ApplicationController

    def home
    end

    def new
        @session = Session.new
        if logged_in?
            redirect_to user_path(current_user)
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end

    def create
        @session = Session.new(params[:session])
        if @session.save
          flash[:success] = "Session successfully created"
          redirect_to login_path(@session)
        else
          flash[:error] = "Something went wrong"
          render :new
        end
    end

    def google
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