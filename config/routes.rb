Appname::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :advertisers
  devise_for :auditors

  authenticated :advertiser do
    resources :ads
  end

  authenticated :auditor do
    resources :ads
  end
  
  root :to => 'home#index'
end
