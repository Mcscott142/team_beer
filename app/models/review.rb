class Review < ActiveRecord::Base
  belongs_to :beer
  belongs_to :user
  has_many :votes, as: :voteable

  validates :rating, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  validates :beer_id, presence: true
end
