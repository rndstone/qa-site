Rails.application.routes.draw do
  root to: "toppages#index"
  get 'recent', to: "toppages#recent"
  get 'active_question', to: "toppages#active_question"
  get 'categorized_question', to: "toppages#categorized_question"
  # get 'search', to: "toppages#search"
  # get 'search', to: "questions#search"
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
  # get 'questions/search', action: :search, controller: 'questions'
  put 'close', to: "questions#put"
  resources :users, only:[:index, :show, :new, :create, :edit, :update] do
    member do
      get :questions
      get :answers
    end
  end
  
  resources :questions, only:[:show, :new, :create, :update, :destroy]
  resources :answers, only:[:create, :edit, :update, :destroy]
  resources :question_likes, only:[:create, :destroy]
  resources :answer_likes, only:[:create, :destroy]
  resources :questioner_responses, only:[:new, :create, :edit, :destroy]
end
