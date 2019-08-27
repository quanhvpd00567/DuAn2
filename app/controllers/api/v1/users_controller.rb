module Api::V1
  class UsersController < Api::V1::BaseController
	before_action :authenticate_user!
	before_action :render_text_gender, only: [:edit, :update, :show, :destory]
    
    def show
    	render json: current_user, status: :ok
    end

    def index
    	render json: {data: UserSerializer::get_list}, status: :ok
	end
	
	private
	def render_text_gender
    	current_user.update_attributes!(display_gender: Settings.user.gender.show[current_user.gender])
	end
  end
end