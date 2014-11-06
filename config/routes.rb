# == Route Map
#
#                 Prefix Verb   URI Pattern                                Controller#Action
#                   root GET    /                                          users#index
#              users_new POST   /users/new(.:format)                       users#new
# auth_facebook_callback GET    /auth/facebook/callback(.:format)          oauth_callbacks#facebook
#                matches GET    /matches(.:format)                         users#matches
#            user_visits POST   /users/:user_id/visits(.:format)           visits#create
#          user_messages POST   /users/:user_id/messages(.:format)         messages#create
#       new_user_message GET    /users/:user_id/messages/new(.:format)     messages#new
#       user_preferences GET    /users/:user_id/preferences(.:format)      preferences#index
#                        POST   /users/:user_id/preferences(.:format)      preferences#create
#                  users GET    /users(.:format)                           users#index
#                        POST   /users(.:format)                           users#create
#               new_user GET    /users/new(.:format)                       users#new
#              edit_user GET    /users/:id/edit(.:format)                  users#edit
#                   user GET    /users/:id(.:format)                       users#show
#                        PATCH  /users/:id(.:format)                       users#update
#                        PUT    /users/:id(.:format)                       users#update
#                        DELETE /users/:id(.:format)                       users#destroy
#                message GET    /messages/:id(.:format)                    messages#show
#                        DELETE /messages/:id(.:format)                    messages#destroy
#                  inbox GET    /inbox(.:format)                           users#inbox
#                 outbox GET    /outbox(.:format)                          users#outbox
#                  convo GET    /users/:user_id/conversation(.:format)     messages#conversation
#                 visits GET    /visits(.:format)                          visits#index
#                session POST   /session(.:format)                         sessions#create
#            new_session GET    /session/new(.:format)                     sessions#new
#                        DELETE /session(.:format)                         sessions#destroy
#        api_user_visits POST   /api/users/:user_id/visits(.:format)       api/visits#create {:format=>:json}
#      api_user_messages POST   /api/users/:user_id/messages(.:format)     api/messages#create {:format=>:json}
#   new_api_user_message GET    /api/users/:user_id/messages/new(.:format) api/messages#new {:format=>:json}
#   api_user_preferences GET    /api/users/:user_id/preferences(.:format)  api/preferences#index {:format=>:json}
#                        POST   /api/users/:user_id/preferences(.:format)  api/preferences#create {:format=>:json}
#  api_user_photo_update PUT    /api/users/:user_id/photo(.:format)        api/users#photo {:format=>:json}
#              api_users GET    /api/users(.:format)                       api/users#index {:format=>:json}
#          edit_api_user GET    /api/users/:id/edit(.:format)              api/users#edit {:format=>:json}
#               api_user GET    /api/users/:id(.:format)                   api/users#show {:format=>:json}
#                        PATCH  /api/users/:id(.:format)                   api/users#update {:format=>:json}
#                        PUT    /api/users/:id(.:format)                   api/users#update {:format=>:json}
#                        DELETE /api/users/:id(.:format)                   api/users#destroy {:format=>:json}
#              api_inbox GET    /api/inbox(.:format)                       api/users#inbox {:format=>:json}
#             api_outbox GET    /api/outbox(.:format)                      api/users#outbox {:format=>:json}
#       api_conversation GET    /api/users/:user_id/conversation(.:format) api/messages#conversation {:format=>:json}
#            api_matches GET    /api/matches(.:format)                     api/users#matches {:format=>:json}
#           api_messages GET    /api/messages(.:format)                    api/messages#index {:format=>:json}
#            api_message GET    /api/messages/:id(.:format)                api/messages#show {:format=>:json}
#                        DELETE /api/messages/:id(.:format)                api/messages#destroy {:format=>:json}
#           api_visitors GET    /api/visits(.:format)                      api/visits#index {:format=>:json}
#

Rails.application.routes.draw do

  root to: 'users#index'

  post '/users/new', to: 'users#new'
  get '/auth/facebook/callback', to: 'oauth_callbacks#facebook'
  get '/matches', to: 'users#matches', as: 'matches'

  resources :users do
    resources :visits, only: [:create]
    resources :messages, only: [:new, :create]
    resources :preferences, only: [:index, :create]
  end

  resources :messages, only: [:destroy, :show]
  get '/inbox', to: 'users#inbox'
  get '/outbox', to: 'users#outbox'
  get '/users/:user_id/conversation', to: 'messages#conversation', as: 'convo'

  resources :visits, only: [:index]

  resource :session, only: [:new, :create, :destroy]

  namespace :api, defaults: { format: :json } do
    resources :users, except: [:new, :create] do
      resources :visits, only: [:create]
      resources :messages, only: [:new, :create]
      resources :preferences, only: [:index, :create]
      put '/photo', to: 'users#photo', as: 'photo_update'
    end

    get 'inbox', to: 'users#inbox'
    get 'outbox', to: 'users#outbox'
    get '/users/:user_id/conversation', to: 'messages#conversation', as: 'conversation'
    get '/matches', to: 'users#matches', as: 'matches'

    resources :messages, only: [:destroy, :show, :index]
    resources :visits, only: [:index], as: 'visitors'
  end

end
