Rails.application.routes.draw do
  resource :user
  resources :goals do
    patch 'updateStatus', :on => :member
  end
  resource :session
end
