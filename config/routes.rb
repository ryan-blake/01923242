Rails.application.routes.draw do
  resources :charges
  resources :terms
  root to: 'spots#index'
  resources :user
  devise_for :users, :controllers => { :omniauth_callbacks =>"omniauth_callbacks" }
  resources :spots
  get 'complete_charge' => 'charges#complete'

# pages
    get '/secret', to: 'spots#secret', as: :secret

end
