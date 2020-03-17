Rails.application.routes.draw do
  devise_for :users
  root to: 'pins#index'
  get 'dashboard', to: 'pages#dashboard'
  resources :comments, only: [:destroy, :update, :edit]
  resources :pins, except: :index do
    resources :comments, only: [:create, :new]
    resources :votes, only: [:create, :new]
  end

  resources :visits, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
