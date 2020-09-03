Rails.application.routes.draw do
  root "tweeets#index"
  resources :tweeets do
    collection do
      post :confirm
    end
  end
  
  root "tweeets#index"
end
