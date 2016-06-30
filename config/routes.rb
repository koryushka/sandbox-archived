Rails.application.routes.draw do

  namespace :api do
    api_version(module: 'V1',defaults: {format: :json},
                header: { name: 'Accept', value: 'application/vnd.cizo.com; version=1' },
                default: true) do
      root 'welcome#index'

      devise_for :users
    end
  end

  root 'welcome#index'
  devise_for :users
end
