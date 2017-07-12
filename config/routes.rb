Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do

      resources :users do 
      end 
      resources :posts do
        get 'search', on: :collection
        resources :comments
      end

      resources :comments do
        resources :comments
      end
      post '/login', to: 'auth#create'
      get   '/login', :to => 'sessions#new'
      get '/auth/:provider/callback', :to => 'sessions#create'
      get '/auth/failure', :to => 'sessions#failure'
      get '/current_user', to: 'auth#show'
      get 'session/new'
      get 'session/create'
      get 'session/failure'
    end
  end
end
