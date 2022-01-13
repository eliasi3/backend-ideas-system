class ResetPasswordController < ApplicationController
  #GET /reset_password
  def index
    @email = params[:email]
    @user = User.where(email: @email)
    
    User.reset_password(params[:email])
    
    render json: @user.to_json(:include => :dept), status: :ok
  end
end
