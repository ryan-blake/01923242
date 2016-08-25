Rails.application.routes.draw do
  resources :terms
  resources :charges
  root to: 'spots#index'
  resources :user
  devise_for :users, :controllers => { :omniauth_callbacks =>"omniauth_callbacks" }
  resources :spots
  get 'complete_charge' => 'charges#complete'
  get 'create_charge' => 'charges#create'
  get 'spots' => 'spots#secrets'
    get '/secret', to: 'spots#secret', as: :secret

end
