Rails.application.routes.draw do
  get 'downgrade_controller/new'

  get 'wikis/index'

  get 'wikis/show'

  get 'wikis/new'

  get 'wikis/edit'

  resources :wikis

  devise_for :users

  get 'about' => 'welcome#about'

  root 'welcome#index'
  
  resources :charges, only: [:new, :create]

  resources :downgrade, only: [:new, :create]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
