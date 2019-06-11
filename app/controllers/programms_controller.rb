class ProgrammsController < ApplicationController
  before_action :set_programm, only: [:show, :update, :destroy]

  # GET /programms
  # GET /programms.json
  def index
    @programms = Programm.all
  end

  # GET /programms/1
  # GET /programms/1.json
  def show
  end

  # POST /programms
  # POST /programms.json
  def create
    @programm = Programm.new(programm_params)

    if @programm.save
      render :show, status: :created, location: @programm
    else
      render json: @programm.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /programms/1
  # PATCH/PUT /programms/1.json
  def update
    if @programm.update(programm_params)
      render :show, status: :ok, location: @programm
    else
      render json: @programm.errors, status: :unprocessable_entity
    end
  end

  # DELETE /programms/1
  # DELETE /programms/1.json
  def destroy
    @programm.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_programm
      @programm = Programm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def programm_params
      params.require(:programm).permit(:channel_id, :episode_id, :timeslot, :date)
    end
end
