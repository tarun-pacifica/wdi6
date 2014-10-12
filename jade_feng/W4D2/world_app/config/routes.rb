Rails.application.routes.draw do
  root :to => 'home#index'
  get '/map' => 'home#map'

  
# mountains
  get '/mountains' => 'mountains#index'
  get '/mountains/new' => 'mountains#new'
  post '/mountains' => 'mountains#create'
  get '/mountains/:id' => "mountains#show", :as => 'mountain' # mountain path as a single mountain
  post '/mountains/:id' => 'mountains#update'   # Don't need a path name because it already is used above as 'planets_path'
  post '/mountain/:id/delete' => 'mountains#destroy', :as => 'mountain_delete'
  get '/mountain/:id/edit' => 'mountains#edit', :as => 'mountain_edit'
  
# oceans
  get '/oceans' => 'oceans#index'
  get '/oceans/new' => 'oceans#new'
  post '/oceans' => 'oceans#create'
  get '/oceans/:id' => "oceans#show", :as => 'ocean' # ocean path as a single ocean
  post '/oceans/:id' => 'oceans#update'   # Don't need a path name because it already is used above as 'planets_path'
  post '/ocean/:id/delete' => 'oceans#destroy', :as => 'ocean_delete'
  get '/ocean/:id/edit' => 'oceans#edit', :as => 'ocean_edit'
  

# world wonders
  get '/wonders' => 'wonders#index'
  get '/wonders/new' => 'wonders#new'
  post '/wonders' => 'wonders#create'
  get '/wonders/:id' => "wonders#show", :as => 'wonder' # wonder path as a single wonder
  post '/wonders/:id' => 'wonders#update'   # Don't need a path name because it already is used above as 'planets_path'
  post '/wonder/:id/delete' => 'wonders#destroy', :as => 'wonder_delete'
  get '/wonder/:id/edit' => 'wonders#edit', :as => 'wonder_edit'


end
