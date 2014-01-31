class TagsController < ApplicationController
=begin  
def index
	@tags = Tag.where("name like ?", "%#{params[:q]}%")
	respond_to do |format|
	  format.html
	  format.json { render :json => @tags.map(&:attributes) }
	end
end
=end
  def index
    @tags = Tag.order(:name)
    respond_to do |format|
      format.js
      format.json { render :json => @tags.tokens(params[:q]) }
    end
  end

end