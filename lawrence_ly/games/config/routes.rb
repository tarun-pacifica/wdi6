Rails.application.routes.draw do
  root :to => 'pages#home'

  get '/home' => 'pages#home'

  get '/magic_ball' => 'pages#magic'
  post '/magic_ball/response' => 'pages#magic_response'

  get '/secret_number' => 'pages#secret'
  post'/secret_number/answer' => 'pages#secret_answer'
  get '/secret_number/answer' => 'pages#secret_answer'

  get '/rock_paper_scissors' => 'pages#rcp'
  post '/rock_paper_scissors/result' => 'pages#rcp_result'
  get '/rock_paper_scissors/result' => 'pages#rcp_result'
  
end
