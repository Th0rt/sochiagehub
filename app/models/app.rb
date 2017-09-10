class App < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :image_url, presence: true, length: { maximum: 255 }
end
