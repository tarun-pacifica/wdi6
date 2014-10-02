Rails.application.routes.draw do

root :to => 'oceans#index'
# get '/oceans' => 'oceans#index'
# get '/oceans' => 'oceans#path'
# get '/oceans/new' => 'oceans#new'
# post '/oceans' => 'oceans#create'
# get '/oceans/:id' => 'oceans#show', :as => 'ocean'

post '/oceans/:id/edit' => 'oceans#edit', :as => 'ocean_edit'
post '/oceans/:id/delete' => 'oceans#destroy', :as => 'ocean_delete'
resources :oceans

end
