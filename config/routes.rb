Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :posts do
        get 'search', on: :collection
        resources :comments
      end

      resources :comments do
        resources :comments
      end
      post '/login', to: 'auth#create'
      get '/current_user', to: 'auth#show'
    end
  end
end
