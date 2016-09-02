Rails.application.routes.draw do
  resources :users do
    member do
      get :destroy_warning
    end
  end

    

  devise_for :accounts, controllers: { registrations: "registrations" } do
    get '/accounts/sign_out' => 'devise/sessions#destroy'
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get 'home/index'
  get '/home/index', to: 'home#index', as: 'home'        # default page for not-logged users
  get '/home/index', to: 'home#index', as: 'dashboard'   # default page logged users
  root to: "home#index"
end
