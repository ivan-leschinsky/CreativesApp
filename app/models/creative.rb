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


	#pREVIOUS tAGS, WORKING

  #For search
  def self.tagged_with(name)
	  Tag.find_by_name!(name).creatives
	end

	def self.tag_counts
	  Tag.select("tags.*, count(taggings.tag_id) as count").
	    joins(:taggings).group("taggings.tag_id")
	end

	def tag_list
	  tags.map(&:name).join(", ")
	end

	def tag_list=(names)
	  self.tags = names.split(",").map do |n|
	    Tag.where(name: n.strip).first_or_create!
	  end
	end
end
