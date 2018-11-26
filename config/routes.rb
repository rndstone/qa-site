Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  get 'users/new'

  get 'users/create'

  get 'users/update'

  get 'users/destroy'

  root to: "toppages#index"
  resources :users, only:[:index, :show, :new, :create]
end
