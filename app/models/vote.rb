class Vote < ActiveRecord::Base
  belongs_to :voteable, polymorphic: true
  belongs_to :user

  validates :vote, numericality: { greater_than: -2, less_than: 2 }
  validates :user_id, uniqueness: { scope: [:voteable_type, :voteable_id] }
  validates :voteable_id, presence: true
  validates :voteable_type, presence: true
  validates :user_id, presence: true
end
