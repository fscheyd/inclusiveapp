class ReviewsController < ApplicationController

    def index
        @review = Review.all
    end
    
    def new
        @business = Business.find_by(id: params[:business_id])
        @review = @business.reviews.build()
    #    if params[:business_id] && @business = Business.find_by_id(params[:business_id])
    #         @review = @business.reviews.new
    #    else
    #         @businesses = Business.business_list
    #         @review = Review.new
    #    end
       
    end


    def show
        @review = Review.find(params[:id])
    end

    def create
        @review = current_user.reviews.build(review_params)
        if @review.save
            redirect_to review_path(@review)
        else
            render :new
        end
        # after creating, reroute to the business show page, but make sure 
        # you have the show page, also displaying an index of that specific businesses reivews 
    end


    def edit
        @review = Review.find(params[:id])
    end

    def update
        @review = Review.find(params[:id])
        @review.update(review_params)
        redirect_to review_path(@review)
    end

    def destroy
        review = Review.find(params[:id])
        review.destroy(review_params)
        redirect_to review path
    end

    private

    def review_params
        params.require(:review).permit(:review_title, :review_body, :accesibility_features, :accesibility_rating, :user_id, :business_id)
    end
end
