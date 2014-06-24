class Review < ActiveRecord::Base
  belongs_to :beer
  has_many :votes, as: :voteable
end
