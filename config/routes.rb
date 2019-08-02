Rails.application.routes.draw do
  namespace :manager do
    get '/', to: 'index#index'
  end

  scope module: :public do
    root 'index#index'
  end

  # Api
  namespace :api do
    namespace :v1 do
      resources :users
    end
  end
end
