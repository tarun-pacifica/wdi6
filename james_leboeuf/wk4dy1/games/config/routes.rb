Rails.application.routes.draw do
  root :to => 'pages#home'

  get '/eight' => 'eight#index'
  get '/eight/lookup' => 'eight#lookup'

  get '/secret_number' => 'secret_number#index'
  get '/secret_number/lookup' => 'secret_number#lookup'

  get '/prs' => 'prs#index'
  get '/prs/lookup' => 'prs#lookup'

end
