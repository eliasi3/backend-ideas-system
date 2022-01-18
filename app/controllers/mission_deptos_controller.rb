class MissionDeptosController < ApplicationController
  before_action :set_mission_depto, only: [:show, :update, :destroy]

  # GET /mission_deptos
  def index
    @mission_deptos = MissionDepto.all

    render json: @mission_deptos
  end

  # GET /mission_deptos/1
  def show
    render json: @mission_depto
  end

  # POST /mission_deptos
  def create
    # @mission_depto = MissionDepto.new(params[:dept_id])
   
    # params[:dept_id].each { |n| @mission_depto = "Current number is: #{n}" }
    # if @mission_depto.save
      @mission_depto = params[:dept_id]
      
      render json: { mission: @mission_depto}, status: :created
    # else
    #   render json: @mission_depto.errors, status: :unprocessable_entity
    # end
  end

  # PATCH/PUT /mission_deptos/1
  def update
    if @mission_depto.update(mission_depto_params)
      render json: @mission_depto
    else
      render json: @mission_depto.errors, status: :unprocessable_entity
    end
  end

  # DELETE /mission_deptos/1
  def destroy
    @mission_depto.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mission_depto
      @mission_depto = MissionDepto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mission_depto_params
      params.require(:mission_depto).permit(:mission_id, :dept_id)
    end
end
