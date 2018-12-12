Rails.application.routes.draw do
  get 'answers/create'

  get 'answers/edit'

  get 'answers/destroy'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  root to: "toppages#index"
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
  
  resources :users, only:[:index, :show, :new, :create, :edit, :update] do
    member do
      get :questions
      get :answers
    end
  end
  
  resources :questions, only:[:show, :new, :create, :destroy]
end
