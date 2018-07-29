Rails.application.routes.draw do
  get 'todos/index'
  get 'checklist/create'
  get 'todos/:id', to: 'todos#show', as: 'todo'
  resources :todos, only: :index do
    resources :checklists, only: :create
  end
  resources :checklists, only: :index
  get 'checklists/:id/edit', to: 'checklists#edit', as: 'edit'
  patch 'checklists/:id', to: 'checklists#update', as: 'checklist/update'
  get 'checklists/:id/complete', to: 'checklists#complete', as: 'complete'

  root to: 'todos#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
