Rails.application.routes.draw do
  resources :user
  resources :goals do
    patch 'updateStatus', :on => :member
  end
  resource :session
end
