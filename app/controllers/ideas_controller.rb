class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :update, :destroy]

  # GET /ideas
  # def index
  #   @ideas = Idea.all

  #   render json: @ideas.to_json(:include => [:user, :category, :mission]), status: :ok
  # end

  def index
    @str = 'id > 0'
    @count = ''

    if (!params[:mission_id].blank?)
        @str += ' AND mission_id='+ params[:mission_id]
    end
    if (!params[:category_id].blank?)
        @str += ' AND category_id='+ params[:category_id] 
    end
    if (!params[:search].blank?)
        @str += " AND (UPPER(idea_description) LIKE '%"+params[:search].upcase+"%' OR UPPER(idea_name) LIKE '%"+params[:search].upcase+"%')"
    end
    if (!params[:page].blank?)
      @ideas = Idea.where(@str).limit(2).offset(params[:page].to_i*2)
    else
      @ideas = Idea.where(@str)
    end  
      @count = Idea.where(@str).count
    render json: @ideas.to_json(:include => [:user, :category, :mission]), status: :ok
  end


  # def index
  #   # @livros = Livro.where(author: params[:author])
  #   if (params[:author])
  #     @livros = Livro.where(author: params[:author]);
  #   else
  #     @livros = Livro.all;
      
  #   end
  #   render json: { data: @livros }, status: :ok
  #   # @livros = Livro.all
  # end

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
