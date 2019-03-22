Rails.application.routes.draw do
  
  namespace :activity do
    get 'build_controller/show'
    get 'build_controller/update'
  end

  devise_for :users, :controllers => {:registrations => "registrations", :passwords => 'passwords'}
  
  resources :activities do
    resources :build, only: [:show, :update], controller: 'activity/build'
  end

  root to: 'pages#index'

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
