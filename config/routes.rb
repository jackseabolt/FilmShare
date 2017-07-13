Rails.application.routes.draw do

    devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations', 
        passwords: 'users/passwords'
    }

  post '/rate' => 'rater#create', :as => 'rate'
  resources :movies, only: [:show, :index, :create, :edit, :update, :destroy] do 
  	resources :reviews, only: [:create] 
  end 

  root 'movies#index'

end
