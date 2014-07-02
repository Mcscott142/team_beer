class Brewery < ActiveRecord::Base
  has_many :beers
  belongs_to :region

  validates :name, presence: true

  def self.brewery_search(search)
    where('name ILIKE ? OR description ILIKE ?', "%#{search}%", "%#{search}%")
  end
end
