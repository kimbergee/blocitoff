Rails.application.routes.draw do
  get 'items/create'

  get 'welcome/index'
  get 'welcome/about'
  get 'users/show'
  root 'welcome#index'

  devise_for :users

  resources :users do
    resources :items, only: [:create, :destroy]
  end

#  get 'about' => 'welcome#about'
end
