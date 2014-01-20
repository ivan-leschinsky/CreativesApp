class Section < ActiveRecord::Base
	belongs_to :creative,  :inverse_of => :sections
end
