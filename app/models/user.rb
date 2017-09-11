class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :rel_apps
  has_many :apps, through: :rel_apps
  
  def have(app)
    self.rel_apps.find_or_create_by(app_id: app.id)
  end
  
  def unhave(app)
    rel = self.rel_apps.find_by(app_id: app.id)
    rel.destroy
  end
  
  def have?(app)
    self.apps.exists?(trackid: app.trackid)
  end
  
end