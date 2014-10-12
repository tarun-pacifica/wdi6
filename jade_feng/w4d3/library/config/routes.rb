# == Route Map
#
#      Prefix Verb   URI Pattern                 Controller#Action
#        root GET    /                           home#index
#     authors GET    /authors(.:format)          authors#index
#             POST   /authors(.:format)          authors#create
#  new_author GET    /authors/new(.:format)      authors#new
# edit_author GET    /authors/:id/edit(.:format) authors#edit
#      author GET    /authors/:id(.:format)      authors#show
#             PATCH  /authors/:id(.:format)      authors#update
#             PUT    /authors/:id(.:format)      authors#update
#             DELETE /authors/:id(.:format)      authors#destroy
#       books GET    /books(.:format)            books#index
#             POST   /books(.:format)            books#create
#    new_book GET    /books/new(.:format)        books#new
#   edit_book GET    /books/:id/edit(.:format)   books#edit
#        book GET    /books/:id(.:format)        books#show
#             PATCH  /books/:id(.:format)        books#update
#             PUT    /books/:id(.:format)        books#update
#             DELETE /books/:id(.:format)        books#destroy
#       users GET    /users(.:format)            users#index
#             POST   /users(.:format)            users#create
#    new_user GET    /users/new(.:format)        users#new
#   edit_user GET    /users/:id/edit(.:format)   users#edit
#        user GET    /users/:id(.:format)        users#show
#             PATCH  /users/:id(.:format)        users#update
#             PUT    /users/:id(.:format)        users#update
#             DELETE /users/:id(.:format)        users#destroy
#

Rails.application.routes.draw do
	root :to => 'home#index'
  resources :authors, :books, :users

end
