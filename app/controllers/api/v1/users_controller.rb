module Api::V1
  class UsersController < Api::V1::BaseController
    before_action :authenticate_user!, only: [:index]
    def edit
      render json: {
          user: current_user
      }, status: :ok
    end

    def index
      render json: {
          user: current_user
      }, status: :ok
    end
  end
end