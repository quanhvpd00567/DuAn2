class Public::IndexController < Public::BaseController
    def index
        params[:page] = params[:page].present? ? params[:page] : 1
        @users = UserSerializer::get_list.page(params[:page]).per(1)
    end
end
