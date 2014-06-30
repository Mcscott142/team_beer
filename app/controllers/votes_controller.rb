class VotesController < ApplicationController
  def create
    vote = Vote.new(vote: params[:vote])
    vote.voteable_detection(params)
    if current_user
      vote.user_id = current_user.id
      if Vote.find_by(user_id: current_user.id, voteable_id: vote.voteable_id,
                      voteable_type: vote.voteable_type)
        flash[:notice] = "You already voted on that!"
      else
        vote.save
        vote.vote_on_this_object
      end
    else
      flash[:notice] = "You must log in to vote!"
    end
    if vote[:voteable_type] == 'Beer'
      redirect_to beers_path
    else
      redirect_to beer_path(params[:beer_id])
    end
  end
end
