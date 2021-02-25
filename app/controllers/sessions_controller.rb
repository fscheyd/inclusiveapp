class SessionsController < ApplicationController
    def new
        if logged_in?
          redirect_to user_path(current_user)
        end
    end
    
     
    def destroy
        session.delete(:user_id)
        redirect_to '/login'
    end
    
end
