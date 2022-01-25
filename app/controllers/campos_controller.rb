class CamposController < ApplicationController
  before_action :set_campo, only: [:show, :update, :destroy]

  # GET /campos
  def index
    @str = 'id > 0'

    if (!params[:mission_id].blank?)
      @str += ' AND mission_id='+ params[:mission_id]
    end

    @campos = Campo.where(@str)

    render json: @campos
  end

  # GET /campos/1
  def show
    render json: @campo
  end

  # POST /campos
  def create
    @campo = Campo.new(campo_params)

    if @campo.save
      render json: @campo, status: :created, location: @campo
    else
      render json: @campo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /campos/1
  def update
    if @campo.update(campo_params)
      render json: @campo
    else
      render json: @campo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /campos/1
  def destroy
    @campo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campo
      @campo = Campo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def campo_params
      params.require(:campo).permit(:cam_nome, :cam_tipo, :ies_ordem, :ies_obrigatorio, :mission_id)
    end
end
