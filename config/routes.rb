Rails.application.routes.draw do

  root to: 'pages#index'
  
  devise_for :users, :controllers => {:registrations => "registrations", :passwords => 'passwords'}

  resources :activities, except: :show, path_names: { new: 'categories/:id/timer' } 

  scope '/activities' do
    resources :categories, only: [:index]
  end


  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
