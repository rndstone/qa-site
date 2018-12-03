Rails.application.routes.draw do
  get 'questions/new'

  get 'questions/create'

  get 'questions/show'

  get 'questions/destroy'

  root to: "toppages#index"
  resources :users, only:[:index, :show, :new, :create] do
    member do
      get :questions
      get :answers
    end
  end
  
  resources :questions, only:[:show, :new, :create, :destroy]
end
