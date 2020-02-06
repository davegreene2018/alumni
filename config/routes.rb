Rails.application.routes.draw do
  
  resources :colleges
  resources :profiles
  get 'static_pages/index'
  get 'static_pages/home'
  get 'static_pages/members'
  resources :channels 
  resources :subjects 
  resources :forums do 
  resources :replies 
end 

 

  root 'static_pages#home'
  get '/members' => 'static_pages#members'
  get '/home' => 'static_pages#home'
  get '/profile' => 'static_pages#profile'

  get '/replies/like/:id' => 'replies#like'
  get '/replies/dislike/:id' => 'replies#dislike' 

  #get '/search' => 'static_pages#search' 
  post '/search' => 'forums#search'
  
  get '/search' => 'static_pages#searchforums'


  devise_for :users, controllers: {registrations: 'registrations'}
end
