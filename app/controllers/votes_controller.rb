class VotesController < ApplicationController
  def create
    vote = Vote.new(vote: params[:vote])
    vote.voteable_detection(params)
    if current_user
      vote.user_id = current_user.id
      existing_vote = Vote.find_by(user_id: current_user.id, voteable_id: vote.voteable_id,
                      voteable_type: vote.voteable_type)
      if existing_vote
        if existing_vote.vote.to_i == -1 && params[:vote].to_i == 1
          existing_vote.vote = 1
          existing_vote.save
          2.times {existing_vote.vote_on_this_object}
        elsif existing_vote.vote.to_i == 1 && params[:vote].to_i == -1
          existing_vote.vote = -1
          existing_vote.save
          2.times {existing_vote.vote_on_this_object}
        elsif existing_vote.vote.to_i == params[:vote].to_i
          flash[:notice] = "You already voted on that!"
        end
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
