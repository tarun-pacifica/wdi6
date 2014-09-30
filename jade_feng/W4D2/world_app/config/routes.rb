Rails.application.routes.draw do
  root :to => 'home#index'

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
  get '/oceans/:id' =>'oceans#show', :as =>'ocean'



# world wonders



end
