class VotesController < ApplicationController

  def create
    vote = Vote.new(vote: params[:vote])
    voteable_detection(vote)
    vote.user_id = current_user.id
    if !Vote.find_by(user_id: current_user.id, voteable_id: vote.voteable_id, voteable_type: vote.voteable_type).nil?
      flash[:notice] = "You already voted on that!"
    else
      vote.save
    end
    redirect_to beers_path(params[:beer_id])
  end

  private

  def voteable_detection(vote)
    if !params[:beer_id].nil?
      vote[:voteable_id] = params[:beer_id]
      vote.voteable_type = 'Beer'
    else
      vote[:voteable_id] = params[:review_id]
      vote.voteable_type = 'Review'
    end
    vote
  end
end
