Rails.application.routes.draw do

  get 'welcome/home'

  resources :locations
  resources :categories
  resources :activities do
    resources :reviews
  end
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
end
