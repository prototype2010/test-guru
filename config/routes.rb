Rails.application.routes.draw do
  root to: 'tests#index'

  get :signin, to: 'sessions#new'
  get :signup, to: 'users#new'
  delete :logout, to: 'sessions#destroy'

  resources :users, only: %i[new create]
  resources :sessions, only: %i[new create destroy]

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
