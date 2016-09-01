Rails.application.routes.draw do
  resources :events

  resources :spots do
    resources :events, only: [:create, :destroy]
end

  resources :charges

  get 'my_spots' => 'pages#spots'

  get 'list' => 'pages#list'

  get 'complete_charge' => 'charges#complete'

  resources :terms
  root to: 'spots#index'
  resources :user
  devise_for :users, :controllers => { :omniauth_callbacks =>"omniauth_callbacks" }


# pages
    get '/secret', to: 'spots#secret', as: :secret

end
