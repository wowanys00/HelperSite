Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show,:index]
  root 'works#index'
  resources :works
  resources :conversations do
    resources :messages
   end  
  resources :comments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
