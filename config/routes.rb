Rails.application.routes.draw do
  root to: "toppages#index"
  get 'recent', to: "toppages#recent"
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
  resources :answers, only:[:create, :edit, :destroy]
  resources :question_likes, only:[:create, :destroy]
  resources :answer_likes, only:[:create, :destroy]
end
