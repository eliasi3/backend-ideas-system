class MissionsController < ApplicationController
  before_action :set_mission, only: [:show, :update, :destroy]

  # GET /missions
  def index
    @str = 'id > 0 AND ies_ativo = 1'
    
    if params[:img]
      file = params[:img] #this will get the filename
      send_file Rails.root.join("arquivos/missions", "#{file}"), type: "image/gif", disposition: "inline"
    else
      if (!params[:dept_id].blank?)
          @str += ' AND dept_id='+ params[:dept_id]
      end
      if (!params[:search].blank?)
        @str += " AND (UPPER(mis_name) LIKE '%"+params[:search].upcase+"%' OR UPPER(mis_description) LIKE '%"+params[:search].upcase+"%')"
      end
      if (!params[:page].blank?)
        @missions = Mission.where(@str).limit(2).offset(params[:page].to_i*2)
      else
      @missions = Mission.where(@str)
    end
    render json: @missions.to_json(:include => [:user, :dept]), status: :ok
    end  
  end

  # GET /missions/1
  def show
    render json: @mission.to_json(:include => [:user, :dept]), status: :ok
  end

  # POST /missions
  def create
    
    @mission = Mission.new

    @diretorio_arquivo = "#{Rails.root}/arquivos/missions"
    Mission.upload_arquivo(params[:file], @diretorio_arquivo)

    @mission.mis_name = params[:mis_name]
    @mission.dept_id = params[:dept_id]
    @mission.mis_description = params[:mis_description]
    @mission.mis_image = params[:file].original_filename
    @mission.user_id = params[:user_id]

    @mission.ies_ativo = params[:ies_ativo]
    @mission.ies_multi = params[:ies_multi]
    @mission.dat_limite = params[:dat_limite]   
   

    @mission.save
    render json: @mission, status: :created, location: @mission

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