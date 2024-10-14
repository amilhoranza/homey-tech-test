module Api
  class ApplicationApiController < ActionController::API
    before_action :authenticate_request

    private

    def authenticate_request
      token = request.headers['Authorization']
      decoded_token = JsonWebToken.decode(token)
      @current_user = User.find_by(id: decoded_token[:user_id]) if decoded_token
      render json: { error: 'Not Authorized' }, status: :unauthorized unless @current_user
    end
  end
end
