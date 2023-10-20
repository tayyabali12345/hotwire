Rails.application.routes.draw do
  root to: 'rooms#index'
  resources :rooms do
    resources :messages, only: [:new, :create]
    collection do
      get 'search'
    end
  end
end
