class Creative < ActiveRecord::Base
	has_many :sections, :inverse_of => :creative
	has_many :comments
  has_many :pictures, :inverse_of => :creative
	
	belongs_to :user

  def author?(user)
    self.user == user
  end
  
end
