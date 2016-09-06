Rails.application.routes.draw do
  resources :events

  resources :spots do
    resources :events, only: [:create, :destroy, :show]
    collection do
      get 'search', 'search_boats'

    end
end

  resources :charges

  get 'my_spots' => 'pages#spots'

  get 'list' => 'pages#list'

  get 'complete_charge' => 'charges#complete'

  resources :terms
  resources :parks

  root to: 'spots#index'
  resources :user
  devise_for :users, :controllers => { :omniauth_callbacks =>"omniauth_callbacks" }


# pages
    get '/secret', to: 'spots#secret', as: :secret
    get '/new_boat', to: 'spots#new_boat', as: :new_boat
    get '/boats', to: 'spots#boats', as: :boats

end
