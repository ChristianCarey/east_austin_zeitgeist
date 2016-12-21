Rails.application.routes.draw do
  get 'abouts/show'

  root 'comments#index'
  resources :comments, only: [:index, :show]
end
