class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :image
  validates_presence_of :user_id
  validates_presence_of :image_id
end
