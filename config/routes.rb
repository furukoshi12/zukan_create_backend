Rails.application.routes.draw do
  namespace :api, format: 'json' do
    namespace :v1 do
      post '/signup', to: 'users#create'
      post '/login', to: 'authentications#create'
      delete '/logout', to: 'authentications#logout'
      post '/guest_login', to: 'authentications#guest_login'
      get '/current_user', to: 'users#current_user_info'

      resources :users, only: %i[index show update destroy]
      resources :illustrated_books, only: %i[index show]
      resources :likes, only: %i[create show]

      resource :user, only: [] do
        scope module: :user do
          resources :illustrated_books
            collection do
              get '/likes', to: 'illustrated_books#likes'
            end
        end
      end
    end
  end
end
