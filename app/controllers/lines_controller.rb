class LinesController < ApplicationController
  before_action :set_line, only: [:show, :edit, :update, :destroy]

  def index
    @lines = Line.order(:code).limit(50)
  end

  def search
    respond_to do |format|
      format.html
      format.json { @lines = Line.search(params[:term]) }
    end
  end

  def show
  end

  def new
    @line = Line.new
  end

  def edit
  end

  def create
    @line = Line.new(line_params)

    respond_to do |format|
      if @line.save
        format.html { redirect_to @line, notice: 'Line was successfully created.' }
        format.json { render :show, status: :created, location: @line }
      else
        format.html { render :new }
        format.json { render json: @line.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @line.update(line_params)
        format.html { redirect_to @line, notice: 'Line was successfully updated.' }
        format.json { render :show, status: :ok, location: @line }
      else
        format.html { render :edit }
        format.json { render json: @line.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @line.destroy
    respond_to do |format|
      format.html { redirect_to lines_url, notice: 'Line was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line
      @line = Line.find(params[:id])
      @key = '+AIzaSyAGJEmtpjtyx-V5NL4EUpANsydcD2TdYmY'
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_params
      params.require(:line).permit(:code, :itinerary, :company, :terminal, :map_id, :kml_filename)
    end
end
