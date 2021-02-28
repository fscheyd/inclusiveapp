class ReviewsController < ApplicationController

    def index
        @review = Review.all
    end
    
    def new
        @review = Review.new
    end


    def show
        @rating = Review.find(params[:id])
    end

    def create
        @review = Review.new(review_params)
        if @review.save
            redirect_to review_path(@review)
        else
            render :new
        end
    end


    def edit
        @review = Review.find(params[:id])
    end

    def update
        @review = Review.find(params[:id])
        @review.update(review_params)
        redirect_to review_path(review)
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
