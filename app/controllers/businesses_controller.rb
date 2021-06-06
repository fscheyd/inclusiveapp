class BusinessesController < ApplicationController
    
    def new
        @business = Business.new
        @business.reviews.build
    end

    def create
        @business = Business.new(business_params)
        if @business.save
            redirect_to business_path(@business)
        else
            render :new
        end

    end

    def index
        if params[:search]
            @user = User.search(params[:search])
        end
        @businesses = Business.all
    end

    def show
        
        @businesses = Business.find_by(params[:id])
        @review = Review.new
    
        if @business.nil?
            redirect_to new_business_path
        end
    end

    private

    def business_params
        #byebug
        params.require(@business).permit(:business_name, :business_type, :business_address, :business_phone_number)
    end
 

end
