require 'api_constraints'

Rails.application.routes.draw do
  get 'home/index'

  root 'home#index'

  namespace :api, defaults: { format: :json } do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :oregonlive, :only => [:index, :create]
      resources :test, :only => [:index, :create]
    end
  end
end
