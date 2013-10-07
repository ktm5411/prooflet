Appname::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users, :controllers => { :registrations => 'registrations' }

  authenticated :user do
    resources :ads
    resources :advertisers, :only => [:new, :create]
  end
  
  root :to => 'home#index'
end
