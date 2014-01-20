class Creative < ActiveRecord::Base
	has_many :sections, :inverse_of => :creative
	belongs_to :user
end
