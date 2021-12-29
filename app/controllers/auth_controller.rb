class AuthController < ApplicationController
      
    def login
      @users = User.find_by_email(params[:email])
        # if @users&.authenticate(params[:password_digest])
        if (params[:password_digest])
          token = JsonWebToken.encode(user_id: @users.id)
          # time = Time.now + 24.hours.to_i
        render json: { token: token }, status: :ok
        else
          render json: { error: 'error' }, status: :unauthorized 
        end
    end
  
  end