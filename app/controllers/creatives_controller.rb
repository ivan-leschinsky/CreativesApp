class CreativesController < ApplicationController
  before_action :set_creative, :only => [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:show, :index]

  def index
    @creatives = Creative.all
  end

  def show
  end

  def new
    @creative = Creative.new
  end

  def edit
  end

  def create
    @creative = Creative.new(creative_params)

    respond_to do |format|
      if @creative.save
        format.html { redirect_to @creative, notice: 'Creative was successfully created.' }
        format.json { render action: 'show', status: :created, location: @creative }
      else
        format.html { render action: 'new' }
        format.json { render json: @creative.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /creatives/1
  # PATCH/PUT /creatives/1.json
  def update
    respond_to do |format|
      if @creative.update(creative_params)
        format.html { redirect_to @creative, notice: 'Creative was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @creative.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /creatives/1
  # DELETE /creatives/1.json
  def destroy
    @creative.destroy
    respond_to do |format|
      format.html { redirect_to creatives_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creative
      @creative = Creative.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def creative_params
      params.require(:creative).permit(:name, :description)
    end
end
