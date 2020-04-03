Rails.application.routes.draw do
  
  resources :colleges
  resources :members
  resources :profiles
  get 'static_pages/index'
  get 'static_pages/home'
  get 'static_pages/members'
  resources :channels 
  resources :subjects 
  resources :friendships
  resources :friends 
  resources :forums do 
  resources :replies

end 

 

  root 'static_pages#home'
  get '/members' => 'static_pages#members'
  get '/myposts' => 'static_pages#myposts'

  get '/friends' => 'friends#myFriends'
  get '/home' => 'static_pages#home'
  get '/browseforums' => 'static_pages#browseforums'
  #get '/profile' => 'static_pages#profile'
  get '/profiles/:user_id' => 'profiles#index'

  get '/replies/like/:id' => 'replies#like'
  get '/replies/dislike/:id' => 'replies#dislike' 
  get '/profiles/like/:id' => 'profiles#like'
  get '/profiles/dislike/:id' => 'profiles#dislike' 

  #get '/search' => 'static_pages#search' 
  post '/search' => 'forums#search'
  
  get '/search' => 'static_pages#searchforums'


  devise_for :users, controllers: {registrations: 'registrations', confirmations: 'confirmations'}
end
