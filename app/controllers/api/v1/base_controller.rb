
module Api::V1
  class BaseController < Api::ApiController
    before_action :authenticate_user

    private
    def authenticate_user
        # Get token header request
        if request.headers['Authorization'].present?
            authenticate_or_request_with_http_token do |token|
                begin
                    jwt_payload = JWT.decode(token, Rails.application.secrets.secret_key_base).first
                    @current_user_id = jwt_payload['id']
                    exp = jwt_payload['exp']
                    # head 403 if jwt_payload['exp'] < 10
                rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
                    head :unauthorized
                end
            end
        else
          head :unauthorized
        end
    end

    def authenticate_user!(options = {})
      head :unauthorized unless signed_in?
    end

    def current_user
      @current_user ||= super || User.find(@current_user_id)
    end

    def signed_in?
      @current_user_id.present?
    end

    def is_admin
      current_user&.role == Settings.user.roles.admin
    end

    def is_super_admin
      current_user&.role == Settings.user.roles.super_admin
    end

    def is_member
      current_user&.role == Settings.user.roles.member
    end

  end
end

