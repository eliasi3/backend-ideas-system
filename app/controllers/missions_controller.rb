class MissionsController < ApplicationController
  before_action :set_mission, only: [:show, :update, :destroy]

  # GET /missions
  def index
    @missions = Mission.all

    render json: @missions.to_json(:include => [:user, :dept]), status: :ok
    
  end

  # GET /missions/1
  def show
    render json: @mission.to_json(:include => [:user, :dept]), status: :ok
  end

  # POST /missions
  def create
    @mission = Mission.new(mission_params)

    if @mission.save
      render json: @mission, status: :created, location: @mission
    else
      render json: @mission.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /missions/1
  def update
    if @mission.update(mission_params)
      render json: @mission
    else
      render json: @mission.errors, status: :unprocessable_entity
    end
  end

  # DELETE /missions/1
  def destroy
    @mission.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mission
      @mission = Mission.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mission_params
      params.require(:mission).permit(:mis_name, :mis_description, :mis_image, :dept_id, :user_id)
    end
end
