Rails.application.routes.draw do
  get 'works/new'
  get 'works/edit'
  get 'works/index'
  get 'works/show'
  devise_for :users
  resources :users, only: [:show,:index]
  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
