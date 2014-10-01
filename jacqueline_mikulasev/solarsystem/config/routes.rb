Rails.application.routes.draw do
  root :to => 'home#home'
  get '/home' => 'home#home'

  get '/planets' => 'planets#index'
  get '/planets/new' => 'planets#new'
  post '/planets' => 'planets#create'
  get '/planets/:id' => 'planets#show', :as => 'planet'
  post '/planets/:id/delete' => 'planets#destroy', :as => 'planet_delete'
  get '/planets/:id/edit' => 'planets#edit', :as => 'planet_edit'
  post '/planets/:id' => 'planets#update'

  get '/oceans' => 'oceans#index'
  get '/oceans/new' => 'oceans#new'
  post '/oceans' => 'oceans#create'
  get '/oceans/:id' => 'oceans#show', :as => 'ocean'
  post '/oceans/:id/delete' => 'oceans#destroy', :as => 'ocean_delete'
  get '/oceans/:id/edit' => 'oceans#edit', :as => 'ocean_edit'
  post '/oceans/:id' => 'oceans#update'

end
