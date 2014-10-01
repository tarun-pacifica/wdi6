Rails.application.routes.draw do
  root :to => 'oceans#index'

  get '/oceans' => 'oceans#index'
  get '/oceans/new' => 'oceans#new'
  post '/oceans' => 'oceans#create'
  get '/oceans/:id' => 'oceans#show', :as => 'ocean'

  post '/oceans/:id/destroy' => 'oceans#destroy', :as => 'ocean_destroy'

  get '/oceans/:id/edit' => 'oceans#edit', :as => 'ocean_edit'
  post '/oceans/:id/' => 'planets#update'
end
