Rails.application.routes.draw do
   root to: 'pages#home'

   get '/magic8ball' => 'magic8ball#index' 
   get '/magic8ball/shake' => 'magic8ball#shake'

   get '/secretnumber' => 'secretnumber#index'
   get '/secretnumber/guess' => 'secretnumber#guess'

   get '/rps' => 'rps#index'
   get '/rps/play/:choice' => 'rps#play'

end
