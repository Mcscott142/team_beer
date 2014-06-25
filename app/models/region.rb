class Region < ActiveRecord::Base
  has_many :breweries

  validates :name, presence: true
end
