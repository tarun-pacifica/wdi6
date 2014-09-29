Rails.application.routes.draw do
 
  root :to => 'pages#home'

  get '/magicball' => 'pages#magicball'
  get '/magicball/result' => 'pages#magicball_result'

  get '/secretnum' => 'pages#secretnum'
  get '/secretnum/result' => 'pages#secretnum_result'

  get '/rockpaperscissors' => 'pages#rockpaperscissors'
  get '/rockpaperscissors/result' => 'pages#rockpaperscissors_result'

end
