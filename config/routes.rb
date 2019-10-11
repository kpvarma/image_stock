Rails.application.routes.draw do
  
  resources :stock_images, only: [:create, :show, :destroy]
  root 'home#index'

end
