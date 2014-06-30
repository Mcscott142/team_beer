class Brewery < ActiveRecord::Base
  has_many :beers
  belongs_to :region

  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :state, presence: true

  def self.brewery_search(search)
    where('name ILIKE ? OR description ILIKE ?', "%#{search}%", "%#{search}%")
  end
end
