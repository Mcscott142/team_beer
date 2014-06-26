class Beer < ActiveRecord::Base
  belongs_to :brewery
  belongs_to :beer_type
  has_many :votes, as: :voteable
  has_many :reviews

  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :brewery_id, presence: true
  validates :beer_type_id, presence: true
  validates :description, presence: true

  def self.search(search)
    find(:all, :conditions => ['title ILIKE ? OR description ILIKE ?', "%#{search}%", "%#{search}%"])
  end

end
