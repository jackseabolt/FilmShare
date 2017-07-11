Rails.application.routes.draw do

  post '/rate' => 'rater#create', :as => 'rate'
  resources :movies do 
  	resources :reviews 
  end 

  root 'movies#index'

end
