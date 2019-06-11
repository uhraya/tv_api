class ShowTypesController < ApplicationController
  before_action :set_show_type, only: [:show, :edit, :update, :destroy]

  # GET /show_types
  # GET /show_types.json
  def index
    @show_types = ShowType.all
  end

  # GET /show_types/1
  # GET /show_types/1.json
  def show
  end

  # GET /show_types/new
  def new
    @show_type = ShowType.new
  end

  # GET /show_types/1/edit
  def edit
  end

  # POST /show_types
  # POST /show_types.json
  def create
    @show_type = ShowType.new(show_type_params)

    respond_to do |format|
      if @show_type.save
        format.html { redirect_to @show_type, notice: 'Show type was successfully created.' }
        format.json { render :show, status: :created, location: @show_type }
      else
        format.html { render :new }
        format.json { render json: @show_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /show_types/1
  # PATCH/PUT /show_types/1.json
  def update
    respond_to do |format|
      if @show_type.update(show_type_params)
        format.html { redirect_to @show_type, notice: 'Show type was successfully updated.' }
        format.json { render :show, status: :ok, location: @show_type }
      else
        format.html { render :edit }
        format.json { render json: @show_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /show_types/1
  # DELETE /show_types/1.json
  def destroy
    @show_type.destroy
    respond_to do |format|
      format.html { redirect_to show_types_url, notice: 'Show type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_show_type
      @show_type = ShowType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def show_type_params
      params.require(:show_type).permit(:name)
    end
end
