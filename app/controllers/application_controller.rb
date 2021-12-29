class ApplicationController < ActionController::API
    # include ActionController::ImplicitRender # if you need render .jbuilder
    # include ActionView::Layouts # if you need layout for .jbuilder
    ##protect_from_forgery with: :exception
    #include SessionsHelper
      # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
  def not_found
        render json: { error: 'not_found' }
    end
    def authorize_request
      header = request.headers['Authorization']
      header = header.split(' ').last if header
      @decoded = JsonWebToken.decode(header)
     
     
      #   begin
      #     @decoded = JsonWebToken.decode(header)
      #     @current_user = User.find(@decoded[:user_id])
      #   rescue ActiveRecord::RecordNotFound => e
      #     render json: { errors: e.message }, status: :ok
      #   rescue JWT::DecodeError => e
      #     render json: { errors: e.message }, status: :ok
      #   end
    end
end
