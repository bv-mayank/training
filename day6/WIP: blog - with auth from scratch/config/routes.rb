Rails.application.routes.draw do
  get 'welcome/index'
	root 'welcome#index'

	get '/login' => 'users#login_page'
	post '/login' => 'users#login_user'
	get '/signup' => 'users#signup_page'
	post '/signup' => 'users#signup_user'
end
