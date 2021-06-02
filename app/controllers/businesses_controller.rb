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
        @business = Business.new(business_params)
        if @business.save
            redirect_to business_path(@business)
        else
            render :new
        end

    end

    def show
        @businesses = Business.find(params[:id])
    end

    private

    def business_params
        params.require(bsuiness).permit(business)
    end
 

end
