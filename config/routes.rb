Rails.application.routes.draw do
  use_doorkeeper do
    controllers tokens: 'doorkeeper/tokens'
  end
  namespace :api do
    devise_for :users, defaults: {format: :json}, controllers: {
        registrations: 'api/auth/registrations',
        confirmations: 'api/auth/confirmations'
    }
    api_version(module: 'V1', defaults: {format: :json},
                header: { name: 'Accept', value: 'application/vnd.sandbox.com; version=1' },
                default: true) do
      root 'welcome#index'

      resources :users, except: [:create] do
        put 'update_me', to: 'users#update_self_account'
        get 'me',        to: 'users#me', on: :collection
      end

      resources :products do
        resources :reviews
      end
    end
  end

  root 'welcome#index'
  # devise_for :users
end
