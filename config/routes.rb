# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      scope 'games' do
        get 'index', to: 'games#index'
        get 'show/:id', to: 'games#show'
        post 'create', to: 'games#create'
        put 'update/:id', to: 'games#update'
        delete 'delete/:id', to: 'games#delete'
      end
    end
  end
end
