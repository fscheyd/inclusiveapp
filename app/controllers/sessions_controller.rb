class SessionsController < ApplicationController
    def home
    end
    
    def new
        @session = Session.new
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
    

    
     
    def destroy
        session.delete(:user_id)
        redirect_to login_path
    end

    def omniauth
        user = User.create_from_omniauth(auth)
        
        if user.valid?
            session[:user_id] = user.id
            redirect_to new_review_path
        else
            flash[:message] = user.errors.full_messages.join("")
            redirect_to businesses_path
        end
    end 

end