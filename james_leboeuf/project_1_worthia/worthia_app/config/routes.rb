# == Route Map
#
#          Prefix Verb   URI Pattern                     Controller#Action
#            root GET    /                               items#index
#       edit_user GET    /users/edit(.:format)           users#edit
#           users GET    /users(.:format)                users#index
#                 POST   /users(.:format)                users#create
#        new_user GET    /users/new(.:format)            users#new
#            user GET    /users/:id(.:format)            users#show
#                 PATCH  /users/:id(.:format)            users#update
#                 PUT    /users/:id(.:format)            users#update
#                 DELETE /users/:id(.:format)            users#destroy
#           items GET    /items(.:format)                items#index
#                 POST   /items(.:format)                items#create
#        new_item GET    /items/new(.:format)            items#new
#       edit_item GET    /items/:id/edit(.:format)       items#edit
#            item GET    /items/:id(.:format)            items#show
#                 PATCH  /items/:id(.:format)            items#update
#                 PUT    /items/:id(.:format)            items#update
#                 DELETE /items/:id(.:format)            items#destroy
#     item_prices GET    /item_prices(.:format)          item_prices#index
#                 POST   /item_prices(.:format)          item_prices#create
#  new_item_price GET    /item_prices/new(.:format)      item_prices#new
# edit_item_price GET    /item_prices/:id/edit(.:format) item_prices#edit
#      item_price GET    /item_prices/:id(.:format)      item_prices#show
#                 PATCH  /item_prices/:id(.:format)      item_prices#update
#                 PUT    /item_prices/:id(.:format)      item_prices#update
#                 DELETE /item_prices/:id(.:format)      item_prices#destroy
#           login GET    /login(.:format)                session#new
#                 POST   /login(.:format)                session#create
#                 DELETE /login(.:format)                session#destroy
#

Rails.application.routes.draw do
  root :to => 'items#index'
  get '/users/edit' => 'users#edit', :as => :edit_user
  resources :users, :except => [:edit]
  resources :items
  resources :item_prices

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  # get '/items' => 'items#index'
  # get '/items/:id' => 'items#show', :as => 'item'
end
