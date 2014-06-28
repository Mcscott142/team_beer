class Vote < ActiveRecord::Base
  belongs_to :voteable, polymorphic: true
  belongs_to :user

  validates :vote, numericality: { greater_than: -2, less_than: 2 }
  validates :user_id, uniqueness: { scope: [:voteable_type, :voteable_id] }
  validates :voteable_id, presence: true
  validates :voteable_type, presence: true
  validates :user_id, presence: true

  def vote_on_this_object
    if self[:vote] == 1 #upvote
      if self[:voteable_type] == "Beer" #a beer
        voted_object = Beer.find(self[:voteable_id])
      else #a review
        voted_object = Review.find(self[:voteable_id])
      end
      voted_object[:vote_count] += 1
    else #downvote
      if self[:voteable_type] == "Beer"
        voted_object = Beer.find(self[:voteable_id])
      else
        voted_object = Review.find(self[:voteable_id])
      end
      voted_object[:vote_count] -= 1
    end
    voted_object.save
  end

  def voteable_detection(params)
    if !params[:review_id]
      self[:voteable_id] = params[:beer_id]
      self.voteable_type = 'Beer'
    else
      self[:voteable_id] = params[:review_id]
      self.voteable_type = 'Review'
    end
  end
end
