Rails.application.routes.draw do
  devise_for :users
  namespace :manager do
    get '/', to: 'index#index'
  end

  scope module: :public do
    root 'index#index'
  end

  # Api
  namespace :api do
    namespace :v1 do
      resources :session
      resources :users
      get 'test', to: 'session#test', as: 'test'
    end
  end
end
