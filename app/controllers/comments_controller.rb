class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]

  # GET /comments
  # def index
  #   @comments = Comment.all

  #   render json: @comments.to_json(:include => [:user, :idea]), status: :ok
  # end

  def index
    @str = 'id > 0'

    if params[:img]
      file = params[:img] #this will get the filename
      send_file Rails.root.join("arquivos/comments", "#{file}"), type: "image/gif", disposition: "inline"
    else
      if (!params[:idea_id].blank?)
        @str += ' AND idea_id='+ params[:idea_id]
    end
      @comments = Comment.where(@str)
      render json: @comments.to_json(:include => [:user, :idea]), status: :ok
  end
  end


  # GET /comments/1
  def show
    render json: @comment
  end

  # POST /comments
  def create
    @comment = Comment.new

    @diretorio_arquivo = "#{Rails.root}/arquivos/comments"
    Comment.upload_arquivo(params[:file], @diretorio_arquivo)

      @comment.com_description = params[:com_description]
      @comment.idea_id = params[:idea_id]
      @comment.com_image = params[:file].original_filename
      @comment.user_id = params[:user_id]


    @comment.save
      render json: @comment, status: :created, location: @comment
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:com_description, :com_image, :idea_id, :user_id)
    end
end
