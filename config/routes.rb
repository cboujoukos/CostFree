Rails.application.routes.draw do
  resources :categories
  resources :activities
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'activities#index'
end
