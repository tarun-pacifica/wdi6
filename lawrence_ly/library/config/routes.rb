Rails.application.routes.draw do
  resources :authors, :books
  root :to => 'authors#index'
end
