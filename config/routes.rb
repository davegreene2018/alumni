Rails.application.routes.draw do
  
  resources :channels 
  resources :subjects 
  resources :forums do 
  resources :replies 
end 

 

  root 'forums#index'


  devise_for :users, controllers: {registrations: 'registrations'}
end
