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
  get '/home/dashboard', to: 'home#dashboard', as: 'dashboard'   # default page logged users
  get '/home/access_denied', to: 'home#access_denied', as: 'access_denied'   # when trying to access resources you don't have the rights
  get '/home/record_not_found', to: 'home#record_not_found', as: 'record_not_found'   # when asking for resources not existing
  root to: "home#index"
end
