class ReviewsController < ApplicationController

  def create
    review = Review.new(review_params)
    review.beer_id = params[:beer_id]
    review.user = current_user

    if !review.save
      flash[:notice] = "Failed to save"
    end

    beer = Beer.find(params[:beer_id])
    reviews = beer.reviews

    rating_sum = reviews.inject(0) {|sum, value| sum + value.rating }
    avg_rating = rating_sum.to_f / reviews.length

    beer.avg_rating = avg_rating
    beer.save

    redirect_to beer_path(params[:beer_id])

  end

  private

  def review_params
    params.require(:review).permit(:title, :description, :rating)
  end

end
