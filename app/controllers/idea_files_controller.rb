class IdeaFilesController < ApplicationController
  before_action :set_idea_file, only: [:show, :update, :destroy]

  # GET /idea_files
  def index
    @idea_files = IdeaFile.all

    render json: @idea_files
  end

  # GET /idea_files/1
  def show
    render json: @idea_file
  end

  # POST /idea_files
  def create
    @idea_file = IdeaFile.new(idea_file_params)

    if @idea_file.save
      render json: @idea_file, status: :created, location: @idea_file
    else
      render json: @idea_file.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /idea_files/1
  def update
    if @idea_file.update(idea_file_params)
      render json: @idea_file
    else
      render json: @idea_file.errors, status: :unprocessable_entity
    end
  end

  # DELETE /idea_files/1
  def destroy
    @idea_file.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea_file
      @idea_file = IdeaFile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def idea_file_params
      params.require(:idea_file).permit(:idea_file, :idea_id)
    end
end
