class Creative < ActiveRecord::Base
	has_many :sections, :inverse_of => :creative
	has_many :comments
	
	belongs_to :user

  def author?(user)
    self.user == user
  end
  
end
