class Beer < ActiveRecord::Base
  belongs_to :brewery
  belongs_to :type
  has_many :votes, as: :voteable
  has_many :reviews
end
