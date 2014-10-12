Rails.application.routes.draw do
  root :to => 'pages#home'
  get 'about' => 'pages#about'

  get '/magic' => 'magic#index'
  get '/magic/result' => 'magic#result'

  get '/secret' => 'secret#index'
  get '/secret/result' => 'secret#result'

  get '/rockpaperscissors' => 'rockpaperscissors#index'
  get '/rockpaperscissors/result' => 'rockpaperscissors#result'

end
