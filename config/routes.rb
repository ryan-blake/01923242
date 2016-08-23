Rails.application.routes.draw do
  root to: 'spots#index'

  devise_for :users, :controllers => { :omniauth_callbacks =>"omniauth_callbacks" }

    resources :spots

# pages
    get '/secret', to: 'spots#secret', as: :secret

end
