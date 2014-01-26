class MarkdownController < ApplicationController
	layout "markitup"

  def preview
    @text = params[:data]
  end
  
end