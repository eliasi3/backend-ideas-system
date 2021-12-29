class UsersController < ApplicationController
  before_action :authorize_request, except: [:create]

  # GET /users
  # def index
  #   @users = User.all

  #   render json: @users
  # end

  def index
    @user = User.find_by_id(@decoded["user_id"])
    render json: { user: @user }, status: :ok
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
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
      params.require(:user).permit(:username, :user_name, :email, :password_digest, :user_phone, :dept_id)
    end
end
