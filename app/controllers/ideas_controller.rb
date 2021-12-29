class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :update, :destroy]

  # GET /ideas
  def index
    @ideas = Idea.all

    render json: @ideas
  end

  # GET /ideas/1
  def show
    render json: @idea
  end

  # POST /ideas
  def create
    @idea = Idea.new(idea_params)

    if @idea.save
      render json: @idea, status: :created, location: @idea
    else
      render json: @idea.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ideas/1
  def update
    if @idea.update(idea_params)
      render json: @idea
    else
      render json: @idea.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ideas/1
  def destroy
    @idea.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def idea_params
      params.require(:idea).permit(:idea_name, :idea_description, :category_id, :mission_id, :user_id)
    end
end
