Rails.application.routes.draw do
  namespace :api, format: 'json' do
    namespace :v1 do
      post '/signup', to: 'authentications#signup'
      post '/login', to: 'authentications#login'
      delete '/logout', to: 'authentications#logout'
      post '/guest_login', to: 'authentications#guest_login'

      resources :users, only: %i[index show update destroy]
    end
  end
end
