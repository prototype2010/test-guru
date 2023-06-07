Rails.application.routes.draw do

  get 'sessions/new'
  get 'users/new'

  get :signin, to: 'sessions#new'
  get :signup, to: 'users#new'
  delete :logout, to: 'sessions#logout'
  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests do
    resources :questions, shallow: true, except: %i[index] do
      resources :answers, shallow: true, except: %i[index]
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end
