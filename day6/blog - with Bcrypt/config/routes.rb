Rails.application.routes.draw do
  get 'welcome/index'
	root 'welcome#index'

	get '/signup' => 'users#new'
	post '/signup' => 'users#create'

	get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

	resources :articles
end
