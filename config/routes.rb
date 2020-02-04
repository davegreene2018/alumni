Rails.application.routes.draw do
  
  resources :profiles
  get 'static_pages/index'
  get 'static_pages/home'
  get 'static_pages/members'
  resources :channels 
  resources :subjects 
  resources :forums do 
  resources :replies 
end 

 

  root 'forums#index'
  get '/members' => 'static_pages#members'
  get '/home' => 'static_pages#home'
  get '/profile' => 'static_pages#profile'

  get '/replies/like/:id' => 'replies#like'
  get '/replies/dislike/:id' => 'replies#dislike'  


  devise_for :users, controllers: {registrations: 'registrations'}
end
