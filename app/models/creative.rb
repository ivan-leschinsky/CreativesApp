class Creative < ActiveRecord::Base
	has_many :chapters, :dependent => :destroy, :inverse_of => :creative
	has_many :comments, :dependent => :destroy
  has_many :pictures, :dependent => :destroy, :inverse_of => :creative
	
	has_many :tags, :through => :taggings
	has_many :taggings, :as => :taggable

	belongs_to :user

	attr_reader :tag_tokens

  def author?(user)
    self.user == user
  end


	def tag_tokens=(ids)
		self.tag_ids = Tag.ids_from_tokens(ids)
  end

	
end
