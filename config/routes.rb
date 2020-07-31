Rails.application.routes.draw do

  get 'contacts' => 'contacts#new'
  post 'contacts' =>'contacts#create'
  get 'contacts/complete' => 'contacts#complete'
  devise_for :users, controllers:{
  	sessions: 		'users/sessions',
  	passwords: 		'users/passwords',
  	registarations: 'users/registarations'
  }

  root 'abouts#index'
  resources :users, only: [:show, :edit, :update ]
  get 'users/:id/mypost' => 'users#mypost', as: 'mypost_user'
  resources :travel_posts do
    resources :comments, only: [:create]
  end
  resources :likes, only: [:create, :destroy]
  resources :tags
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
