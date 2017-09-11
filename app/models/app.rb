class App < ApplicationRecord
  validates :trackid, presence: true, length: { maximum: 255 }
  validates :name, presence: true, length: { maximum: 255 }
  validates :image_url, presence: true, length: { maximum: 255 }
  
  has_many :rel_apps
  has_many :users, through: :rel_apps
  
end
