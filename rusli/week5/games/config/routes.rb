Rails.application.routes.draw do
  root :to => 'pages#home'
  get'/about' => 'pages#about'
  get'/faq' => 'pages#faq'

  get'/magic8' => 'magic8#index'
  # get'/magic8/lookup' => 'magic8#lookup'

  get'/snumber' => 'snumber#index'
  # get'/snumber/lookup' => 'snumber#lookup'

  get'/prs' => 'prs#index'
  # get'/rock/lookup' => 'rock#lookup'

end
