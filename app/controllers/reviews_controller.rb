class ReviewsController < ApplicationController

  def create
    review = Review.new(review_params)
    review.beer_id = params[:beer_id]
    review.user = current_user

    if !review.save
      flash[:notice] = "Failed to save"
    end

    beer = Beer.find(params[:beer_id])
    sql = "SELECT AVG(rating) FROM reviews WHERE reviews.rating IS NOT NULL AND reviews.beer_id = #{beer.id};"
    beer.avg_rating = ActiveRecord::Base.connection.execute(sql).first["avg"].to_f
    beer.save

    redirect_to beer_path(params[:beer_id])

  end

  private

  def review_params
    params.require(:review).permit(:title, :description, :rating)
  end

end
