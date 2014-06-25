class VotesController < ApplicationController

  def create
    vote = Vote.new(vote: params[:vote])
    vote.user_id = current_user.id
    if !params[:beer_id].nil?
      vote.voteable_id = params[:beer_id]
      vote.voteable_type = 'Beer'
    else
      vote.voteable_id = params[:review_id]
      vote.voteable_type = 'Review'
    end

    if !vote.save
      flash[:notice] = "Failed to save"
      binding.pry
    end

    redirect_to beers_path(params[:beer_id])
  end

  private

  def review_params
    params.require(:review).permit(:title, :description, :rating)
  end

end
