Rails.application.routes.draw do
  get 'contacts/new'
  get 'contacts/create'
  devise_for :users, controllers:{
  	sessions: 		'users/sessions',
  	passwords: 		'users/passwords',
  	registarations: 'users/registarations'
  }

  scope module: 'users' do
  	resources :travel_posts, only: [:show, :index]
  end
  root 'abouts#index'
  resources :users, only: [:show, :edit, :update ]
  resources :travel_posts
  resources :tags, only: [:create]
  resources :tag_maps, only:[:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
