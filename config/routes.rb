Rails.application.routes.draw do


  resources :charges

  get 'spots' => 'pages#spots'

  get 'home' => 'pages#home'

  get 'complete_charge' => 'charges#complete'

  resources :terms
  root to: 'spots#index'
  resources :user
  devise_for :users, :controllers => { :omniauth_callbacks =>"omniauth_callbacks" }

    resources :spots

# pages
    get '/secret', to: 'spots#secret', as: :secret

end
