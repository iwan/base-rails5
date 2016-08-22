Rails.application.routes.draw do
  resources :users
  devise_for :accounts do
    get '/accounts/sign_out' => 'devise/sessions#destroy'
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'home/index'
  root to: "home#index"
end
