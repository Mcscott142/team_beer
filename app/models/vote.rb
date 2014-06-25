class Vote < ActiveRecord::Base
  belongs_to :voteable, polymorphic: true

  validates :vote, numericality: {greater_than: -2, less_than: 2}
end
