Rails.application.routes.draw do
  root to: 'tests#index'

  resources :users, only: %i[new create], path_names: { new: :signup }
  resources :sessions, only: %i[new create destroy], path_names: { new: :signin, destroy: :logout }

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
