Rails.application.routes.draw do
  get 'home/index'

  root 'home#index'
  
  namespace :api, defaults: { format: :json } do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :users, :only => [:show, :create, :update, :destroy] do
        resources :products, :only => [:create, :update, :destroy]
      end
      resources :oregonlive, :only => [:index, :create]
    end
  end
end
