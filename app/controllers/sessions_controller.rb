class SessionsController < ApplicationController
    def new
        if logged_in?
          redirect_to user_path(current_user)
        end
    end

    def create
        user = User
            .find_by(email: params["user"]["email"])
            .try(:authenticate, params["user"]["password"])
    
        if user
          session[:user_id] = user.id
          render json: {
            status: :created,
            logged_in: true,
            user: user
          }
        else
          render json: { status: 401 }
        end
      end
    end
    
     
    def destroy
        session.delete(:user_id)
        redirect_to '/login'
    end

    def omniauth
        user = User.create_from_omniauth(auth)
        
        if user,valid?
            session[:user_id] = user.id
            redirect_to new_review_path
        else
            flash[:message] = user.errors.full_messages.join("")
            redirect_to businesses_path
        end
    end

    
    
end
