Rails.application.routes.draw do
  # resources :items
  # resources :checklists
  # resources :tags
  # resources :notes
  # resources :tasks
  # resources :projects
  # resources :users
  resources :users, only: [:show, :create] do 
    resources :projects, only: [:index, :create] # shallow: true gives us [:index, :new, :create]
  end

  resources :projects, only: [:show, :destroy, :update] # shallow: true gives us [:show, :edit, :update, :destroy]
end
