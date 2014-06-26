class ReviewsController < ApplicationController

  def create
    review = Review.new(review_params)
    review.beer_id = params[:beer_id]
    review.user = current_user

    if !review.save
      flash[:notice] = "Failed to save"
    end

    redirect_to beer_path(params[:beer_id])

  end

  private

  def review_params
    params.require(:review).permit(:title, :description, :rating)
  end

end
