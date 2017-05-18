class Recipe < ActiveRecord::Base
  include Sluggable
  
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  
  validates :name, presence: true
  
  sluggable_property(:name)
  
  def total_time
    prep_time + cook_time
  end
end