class Brewery < ActiveRecord::Base
  has_many :beers
  belongs_to :region

  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :state, presence: true
end
