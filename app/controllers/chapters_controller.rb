class ChaptersController < ApplicationController
  before_action :set_creative_chapter, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:show, :index]

  def index
    @chapters = Chapter.all
  end

  def new
    @chapter = Chapter.new
    @chapter.creative_id = params[:creative_id]
  end

  def edit
    #binding.pry
  end

  def create
    @chapter = Chapter.new(chapter_params)
    @chapter.number = @chapter.creative.chapters.count + 1;

    if @chapter.save
      redirect_to @chapter.creative, notice: 'Глава успешно создана.'
    else
      render action: 'new'
    end
  
  end

  def update
    
    if @chapter.update(chapter_params)
      redirect_to @chapter.creative, notice: 'Глава успешно обновлена.'
    else
      render action: 'new'
    end 
  end

  def destroy
    
    creative_id = @chapter.creative_id
    @chapter.destroy

    redirect_to creative_path(creative_id)
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creative_chapter
      @chapter = Chapter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chapter_params
      params.require(:chapter).permit(:name, :number, :body, :creative_id)
    end
end
