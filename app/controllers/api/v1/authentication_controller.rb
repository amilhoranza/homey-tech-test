# app/controllers/api/v1/authentication_controller.rb
module Api
  module V1
    class AuthenticationController < ::Api::ApplicationApiController
      skip_before_action :authenticate_request

      def login
        user = User.find_by(email: params[:email])
        if user && user.valid_password?(params[:password])
          token = JsonWebToken.encode(user_id: user.id)
          render json: { token: token }, status: :ok
        else
          render json: { error: 'Invalid credentials' }, status: :unauthorized
        end
      end
    end
  end
end
