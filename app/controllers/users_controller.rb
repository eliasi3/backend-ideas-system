class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  
  # GET /users
  # def index
  #   @users = User.all
  #   render json: @users.to_json(:include => :dept), status: :ok
  #   # render json: { user: @users }, status: :ok
  # end
  def index
    @str = 'id > 0'

    if (!params[:email].blank?)
      @str += " AND email="+ "'"+params[:email]+"'"
    end
    if (!params[:dept_id].blank?)
      @str += ' AND dept_id='+ params[:dept_id]
    end
    if (!params[:search].blank?)
      @str += " AND (UPPER(user_name) LIKE '%"+params[:search].upcase+"%' OR UPPER(username) LIKE '%"+params[:search].upcase+"%')"
    end
    if (!params[:page].blank?)
      @users = User.where(@str).limit(2).offset(params[:page].to_i*2)
    else
    @users = User.where(@str)
    end

    render json:@users.to_json(:include => :dept), status: :ok
  end

  # GET /users/1
  def show
    render json: @user.to_json(:include => :dept), status: :ok
  end

  # POST /users
  def create

    @user = User.new(user_params)
    
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :user_name, :email, :password, :user_phone, :dept_id)
    end
end
