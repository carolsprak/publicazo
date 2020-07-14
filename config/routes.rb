Rails.application.routes.draw do
  
  root 'pages#home'

  devise_for :users,
  			 path: '',
  			 path_name: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
  			 controllers: {omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}

 resources :users, only: [:show]
 resources :services, except: [:edit] do
  member do
    get 'listing'
    get 'pricing'
    get 'description'
    get 'photo_upload'
    get 'amenities'
    get 'location'
    get 'preload'
    get 'preview'
  end
  resources :photos, only: [:create, :destroy]
  resources :reservation_services, only: [:create]
 end

 resources :guest_review_services, only: [:create, :destroy]
 resources :host_review_services, only: [:create, :destroy]

 get '/preload' => 'reservation_services#preload' 
 get '/preview' => 'reservation_services#preview'


 get '/your_contracted_services' => 'reservation_services#your_contracted_services'
 get '/your_reservation_services' => 'reservation_services#your_reservation_services'
 #get '/reservation_service_info' => 'reservation_services#reservation_service_info'

 get 'search' => 'pages#search'

end
