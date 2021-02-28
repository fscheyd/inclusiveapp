class BusinessesController < ApplicationController
    def index
        if params[:search]
            @user = User.search(params[:search])
        end
        @businesses = business.all
    end
    
    
    
    def new
        @business = Business.new
    end

    def create

    end

    private

    def business_params
        params.require(bsuiness).permit(business)
    end
 

end
