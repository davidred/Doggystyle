# == Route Map
#
#                 Prefix Verb   URI Pattern                            Controller#Action
#                   root GET    /                                      users#new
#              users_new POST   /users/new(.:format)                   users#new
# auth_facebook_callback GET    /auth/facebook/callback(.:format)      oauth_callbacks#facebook
#          user_messages POST   /users/:user_id/messages(.:format)     messages#create
#       new_user_message GET    /users/:user_id/messages/new(.:format) messages#new
#                  users GET    /users(.:format)                       users#index
#                        POST   /users(.:format)                       users#create
#               new_user GET    /users/new(.:format)                   users#new
#              edit_user GET    /users/:id/edit(.:format)              users#edit
#                   user GET    /users/:id(.:format)                   users#show
#                        PATCH  /users/:id(.:format)                   users#update
#                        PUT    /users/:id(.:format)                   users#update
#                        DELETE /users/:id(.:format)                   users#destroy
#               messages GET    /messages(.:format)                    messages#index
#                message GET    /messages/:id(.:format)                messages#show
#                        DELETE /messages/:id(.:format)                messages#destroy
#                session POST   /session(.:format)                     sessions#create
#            new_session GET    /session/new(.:format)                 sessions#new
#                        DELETE /session(.:format)                     sessions#destroy
#

Rails.application.routes.draw do

  root to: 'users#new'

  post '/users/new', to: 'users#new'
  get '/auth/facebook/callback', to: 'oauth_callbacks#facebook'

  resources :users do
    resources :messages, only: [:new, :create, :index]
  end

  resources :messages, only: [:destroy, :show, :index]

  resource :session, only: [:new, :create, :destroy]

end
