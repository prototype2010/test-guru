Rails.application.routes.draw do
  get 'badges/index'
  devise_for :users,
             path: :gurus,
             path_names: { sign_in: :login, sign_out: :logout },
             controllers: {
               sessions: 'users/sessions', only: %i[create]
             }

  root to: 'tests#index'

  resources :feedback, only: %i[new create show]
  resources :badges, only: :index
  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  resources :gists, only: :create

  namespace :admin do
    resources :badges
    resources :gists, only: %i[index]
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: %i[index] do
        resources :answers, shallow: true, except: %i[index]
      end
    end
  end
end
