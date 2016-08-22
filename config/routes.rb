Rails.application.routes.draw do
  root to: 'spots#index'

  devise_for :users

    resources :spots

# pages
    get '/secret', to: 'spots#secret', as: :secret

end
