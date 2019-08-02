
module Api::V1
    class UsersController < Api::ApiController
        def index
            # test
            render json: { users: '12121212' }
        end
    end
end
