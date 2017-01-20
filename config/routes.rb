Rails.application.routes.draw do
  resources :users do
    member do
      get :destroy_warning
    end
  end
  devise_for :accounts


    

  # devise_for :accounts, controllers: { registrations: "registrations" } do
  #   get '/accounts/sign_out' => 'devise/sessions#destroy'
  #   get '/accounts' => 'registrations#new'
  # end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/accounts/', to: 'devise/registrations#new'


  # get 'home/index'
  get '/index', to: 'home#index', as: 'home'                # default page for not-logged users
  get '/terms_of_service', to: 'home#terms_of_service', as: 'terms_of_service'                # default page for not-logged users
  get '/privacy_policy', to: 'home#privacy_policy', as: 'privacy_policy'                # default page for not-logged users
  get '/dashboard', to: 'home#dashboard', as: 'dashboard'   # default page for logged users
  get '/access_denied', to: 'home#access_denied', as: 'access_denied'   # when trying to access resources you don't have the rights
  get '/record_not_found', to: 'home#record_not_found', as: 'record_not_found'   # when asking for resources not existing
  
  root to: "home#index"
end
