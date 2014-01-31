class Tag < ActiveRecord::Base
	
	has_many :pictures, :through => :taggings, :source => :taggable, :source_type => "Picture"
	has_many :creatives, :through => :taggings, :source => :taggable, :source_type => "Creative"

	has_many :taggings, :dependent => :destroy

  # Wraps new tokens to simplify their in Tag base
  def self.tokens(query)
    tags = where("name like ?", "%#{query}%")
    tags.empty? ? [{id: "<<<#{query}>>>", name: "Новый: \"#{query}\""}] : tags
  end

  # Adds wrapped tags in Tag base
  def self.ids_from_tokens(tokens)
    (tokens.gsub(/<<<(.+?)>>>/) { create!(name: $1).id} || tokens).split(',')
  end

  def to_s
    name
  end
  
end
