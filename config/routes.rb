Rails.application.routes.draw do
  # get 'questioner_responses/new'

  # get 'questioner_responses/create'

  # get 'questioner_responses/edit'

  # get 'questioner_responses/destroy'

  root to: "toppages#index"
  get 'recent', to: "toppages#recent"
  get 'active_question', to: "toppages#active_question"
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
  put 'close', to: "questions#put"
  resources :users, only:[:index, :show, :new, :create, :edit, :update] do
    member do
      get :questions
      get :answers
    end
  end
  
  resources :questions, only:[:show, :new, :create, :update, :destroy]
  resources :answers, only:[:create, :edit, :destroy]
  resources :question_likes, only:[:create, :destroy]
  resources :answer_likes, only:[:create, :destroy]
  resources :questioner_responses, only:[:new, :create, :edit, :destroy]
end
