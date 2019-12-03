Rails.application.routes.draw do
  resources :users, only: [:show, :create] do 
    resources :projects, only: [:index, :create] # shallow: true gives us [:index, :new, :create]
    resources :tags, only: [:show]
  end

  resources :projects, only: [:show, :destroy, :update] do # shallow: true gives us [:show, :edit, :update, :destroy]
    resources :tasks, only: [:index, :create]
    resources :notes, only: [:index, :create]
    resources :tags, only: [:index, :create]
  end

  resources :tasks, only: :show
  resources :notes, only: :destroy
  resources :tags, only: [:index] # want to show all projects with said tag
  # get :tags, path:
end
