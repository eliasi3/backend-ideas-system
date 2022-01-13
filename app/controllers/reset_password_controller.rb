class ResetPasswordController < ApplicationController
  #GET /reset_password
  def index
    @str = 'id > 0'

    if (!params[:email].blank?)
      @str += " AND email="+ "'"+params[:email]+"'"
    
    @user = User.where(@str)
    render json:@user.to_json(:include => :dept), status: :ok
  end
end
