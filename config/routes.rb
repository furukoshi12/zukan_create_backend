Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  namespace :api, format: 'json' do
    namespace :v1 do
      post '/signup', to: 'users#create'
      post '/login', to: 'authentications#create'
      delete '/logout', to: 'authentications#logout'
      post '/guest_login', to: 'authentications#guest_login'
      get '/current_user', to: 'users#current_user_info'

      resources :users, only: %i[index show update destroy]
      resources :illustrated_books, only: %i[index show]
      resources :likes, only: %i[create destroy]

      resource :user, only: [] do
        scope module: :user do
          resources :illustrated_books do
            collection do
              get :likes
            end
          end
        end
      end
    end
  end
end
