Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  resources :produtos

  root 'produtos#index'
end
