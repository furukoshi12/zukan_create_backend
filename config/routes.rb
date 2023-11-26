Rails.application.routes.draw do
  get 'templates/index'
  get 'templates/create'
  get 'templates/edit'
  get 'templates/destroy'
  get 'field_designs/index'
  namespace :api do
    namespace :v1 do
      get 'tags/index'
    end
  end
  get 'tags/index'
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
      resources :tags, only: %i[index]
      resources :field_designs, only: %i[index create update destroy]
      resources :templates, only: %i[index create update destroy]

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
