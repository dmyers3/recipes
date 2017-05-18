class User < ActiveRecord::Base
  require 'securerandom'
  
  has_many :recipes
  
  validates :email, presence: true, uniqueness: true
  validates :zip, presence: true, length: { is: 5 }
  validates :password, length: { minimum: 6 }
  
  has_secure_password
  
  before_create :create_slug
  
  def to_param
    self.slug
  end
  
  private
    def create_slug
      sample_slug = SecureRandom.hex(4)
      if User.find_by(slug: sample_slug)
        create_slug
      else
        self.slug = sample_slug
      end
    end
    
    
end