class SectionsController < ApplicationController
  before_action :set_creative_section, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:show, :index]

  def index
    @sections = Section.all
  end

  def new
    @section = Section.new
    @section.creative_id = params[:creative_id]
  end

  def edit
  end

  def create
    @section = Section.new(section_params)
  
    if @section.save
      redirect_to @section.creative, notice: 'Глава успешно создана.'
    else
      render action: 'new'
    end
  
  end

  def update
    
    if @section.update(section_params)
      redirect_to @section.creative, notice: 'Глава успешно обновлена.'
    else
      render action: 'new'
    end 
  end

  def destroy
    
    creative_id = @section.creative_id
    @section.destroy

    redirect_to creative_path(creative_id)
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creative_section
      @section = Section.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def section_params
      params.require(:section).permit(:name, :number, :body, :creative_id)
    end
end
