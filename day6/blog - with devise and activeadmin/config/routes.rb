Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'welcome/index'
  root 'welcome#index'

  devise_for :users

	resources :articles
end
