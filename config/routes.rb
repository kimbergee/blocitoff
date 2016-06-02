Rails.application.routes.draw do
  get 'welcome/index'

  get 'welcome/about'

  #root to: 'welcome#index'
  root 'welcome#index'

  devise_for :users

  get 'users/show'
#  get 'about' => 'welcome#about'
end
