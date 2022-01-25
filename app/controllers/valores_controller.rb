class ValoresController < ApplicationController
  before_action :set_valore, only: [:show, :update, :destroy]

  # GET /valores
  def index
    @valores = Valore.all

    render json: @valores
  end

  # GET /valores/1
  def show
    render json: @valore
  end

  # POST /valores
  def create
    @valore = Valore.new(valore_params)

    if @valore.save
      render json: @valore, status: :created, location: @valore
    else
      render json: @valore.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /valores/1
  def update
    if @valore.update(valore_params)
      render json: @valore
    else
      render json: @valore.errors, status: :unprocessable_entity
    end
  end

  # DELETE /valores/1
  def destroy
    @valore.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_valore
      @valore = Valore.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def valore_params
      params.require(:valore).permit(:val_dec, :val_cha, :val_tex, :val_dat, :val_fil, :campos_id, :ideas_id)
    end
end
