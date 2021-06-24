class BusinessesController < ApplicationController
    
    def new
        @business = Business.new
        @business.reviews.build
    end

    def create
        byebug 
        @business = Business.new(business_params)
        if @business.save
            redirect_to business_path(@business[:id])
        else
            byebug
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
        
        
        @business = Business.find_by(id: params[:id])
        # @review = Review.new
    
        # if @business.nil?
        #     byebug 
        #     redirect_to new_business_path
        # end
    end

    private

    def business_params
        #byebug
        params.require(:business).permit(:business_name, :business_type, :business_address, :business_phone_number)
    end
 

end
