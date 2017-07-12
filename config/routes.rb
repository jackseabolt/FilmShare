Rails.application.routes.draw do

  devise_for :users
  post '/rate' => 'rater#create', :as => 'rate'
  resources :movies do 
  	resources :reviews 
  end 

  root 'movies#index'

end
