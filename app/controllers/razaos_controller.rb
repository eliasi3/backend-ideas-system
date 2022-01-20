class RazaosController < ApplicationController
  before_action :set_razao, only: [:show, :update, :destroy]

  # GET /razaos
  def index
    @str = 'id > 0'
    
    if (!params[:ies_status].blank?)
      @str += ' AND ies_status='+ "'"+ params[:ies_status]+ "'"
    end
    
    @razaos = Razao.where(@str)

    render json: @razaos
  end

  # GET /razaos/1
  def show
    render json: @razao
  end

  # POST /razaos
  def create
    @razao = Razao.new(razao_params)

    if @razao.save
      render json: @razao, status: :created, location: @razao
    else
      render json: @razao.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /razaos/1
  def update
    if @razao.update(razao_params)
      render json: @razao
    else
      render json: @razao.errors, status: :unprocessable_entity
    end
  end

  # DELETE /razaos/1
  def destroy
    @razao.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_razao
      @razao = Razao.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def razao_params
      params.require(:razao).permit(:razao_name, :razao_desc, :ies_status)
    end
end
