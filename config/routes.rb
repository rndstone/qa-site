Rails.application.routes.draw do
  get 'questions/new'

  get 'questions/create'

  get 'questions/show'

  get 'questions/destroy'

  # get 'users/index'

  # get 'users/show'

  # get 'users/new'

  # get 'users/create'

  # get 'users/update'

  # get 'users/destroy'

  root to: "toppages#index"
  resources :users, only:[:index, :show, :new, :create]
  resources :questions, only:[:show, :new, :create, :destroy]
end
