# == Route Map
#
#      Prefix Verb   URI Pattern               Controller#Action
#       users GET    /users(.:format)          users#index
#             POST   /users(.:format)          users#create
#    new_user GET    /users/new(.:format)      users#new
#   edit_user GET    /users/:id/edit(.:format) users#edit
#        user GET    /users/:id(.:format)      users#show
#             PATCH  /users/:id(.:format)      users#update
#             PUT    /users/:id(.:format)      users#update
#             DELETE /users/:id(.:format)      users#destroy
#     session POST   /session(.:format)        sessions#create
# new_session GET    /session/new(.:format)    sessions#new
#             DELETE /session(.:format)        sessions#destroy
#

Rails.application.routes.draw do

  root to: 'users#new'

  post '/users/new', to: 'users#new'
  get '/auth/facebook/callback', to: 'oauth_callbacks#facebook'

  resources :users

  resources :messages, except: [:edit, :update]

  resource :session, only: [:new, :create, :destroy]

end
