Rails.application.routes.draw do
  root :to => 'pages#welcome'
  get '/about' => 'pages#about'
  get '/faq' => 'pages#faq'

  get '/magic8ball' => 'magic8ball#question'
  get '/magic8ball/:question' => 'magic8ball#question'

  get '/secretnumber' => 'secretnumber#number'
  get '/secretnumber/number' => 'secretnumber#user_input'


  # get '/rockpaperscissors/' => 'rockpaperscissors#number'
  # get '/rockpaperscissors/:number' => 'rockpaperscissors#number'



end
