Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:create]

      get 'ranking/current', to: 'user_rankings#current'
      get 'ranking/:year/:month', to: 'user_rankings#year_and_month'
      post 'ranking/record', to: 'user_rankings#create'
      post '/sign_in', to: 'sessions#create'
    end
  end
end
