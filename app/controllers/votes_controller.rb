class VotesController < ApplicationController

  def create
    vote = Vote.new(vote: params[:vote])
    voteable_detection(vote)
    vote.user_id = current_user.id
    if !Vote.find_by(user_id: current_user.id, voteable_id: vote.voteable_id, voteable_type: vote.voteable_type).nil?
      flash[:notice] = "You already voted on that!"
    else
      vote.save
      vote_on_this_object(vote)
    end
    if vote[:voteable_type] == 'Beer'
      redirect_to beers_path(params[:beer_id])
    else
      redirect_to beer_path(params[:beer_id])
    end
  end

  private

  def vote_on_this_object(vote)
    if vote[:vote] == 1 #upvote
      if vote[:voteable_type] == "Beer" #a beer
        voted_object = Beer.find(vote[:voteable_id])
      else #a review
        voted_object = Review.find(vote[:voteable_id])
      end
      voted_object[:vote_count] += 1
    else #downvote
      if vote[:voteable_type] == "Beer"
        voted_object = Beer.find(vote[:voteable_id])
      else
        voted_object = Review.find(vote[:voteable_id])
      end
      voted_object[:vote_count] -= 1
    end
    voted_object.save
  end

  def voteable_detection(vote)
    if !params[:review_id]
      vote[:voteable_id] = params[:beer_id]
      vote.voteable_type = 'Beer'
    else
      vote[:voteable_id] = params[:review_id]
      vote.voteable_type = 'Review'
    end
    vote
  end
end
