Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'
  resources :pins do
    resources :comments, only: [:create, :new, :show, :destroy, :update, :edit]
    resources :votes, only: [:create, :new, :index]
  end

  resources :visits, only: [:create, :new]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
