class User < ActiveRecord::Base
  has_many :reviews
  has_many :votes

  mount_uploader :image, ImageUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true
  validates :username, presence: true
  validates :is_21, presence: true

  after_create :send_welcome_message

  def send_welcome_message
    SignupConfirmation.welcome(self).deliver
    return true
  end

end
