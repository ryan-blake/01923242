Rails.application.routes.draw do

  devise_for :users
  root to: 'spots#index'
    resources :spots

    get '/secret', to: 'spots#secret', as: :secret

end
