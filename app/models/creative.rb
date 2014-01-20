class Creative < ActiveRecord::Base
	has_many :sections, :inverse_of => :creative
end
