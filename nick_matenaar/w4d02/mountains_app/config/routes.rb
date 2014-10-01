Rails.application.routes.draw do
  root to: 'mountains#index'

  get '/mountains', to: 'mountains#index'
  post '/mountains', to: 'mountains#create'

  get '/mountains/new', to: 'mountains#new'

  get '/mountain/:id', to: 'mountains#show', as: 'mountain'
  post '/mountain/:id', to: 'mountains#update'

  get '/mountain/:id/edit', to: 'mountains#edit', as: 'mountain_edit'

  post '/mountain/:id/delete', to: 'mountains#destroy', as: 'mountain_delete'

end
