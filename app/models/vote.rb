class Vote < ActiveRecord::Base
  belongs_to :voteable, polymorphic: true
end
