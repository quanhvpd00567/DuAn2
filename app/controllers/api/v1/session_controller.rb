
module Api::V1
    class SessionController < Api::ApiController
        protect_from_forgery except: :create
        def create
            user = User::find_by(email: params[:email])
            if user&.valid_password?(params[:password])
                render json: {
                    jwt: genera_token({id: user.id})
                }
            else
                render json: {
                    message: 'login invalid'
                }, status: :unprocessable_entity
            end
        end
        private
        # Genera token
        def genera_token(payload = {})
            # Set time token invalid is 24 hours
            exp = 24.hours.from_now
            payload[:exp] = exp.to_i
            # Render token
            JWT.encode(payload, Rails.application.secrets.secret_key_base)
        end
    end
end
