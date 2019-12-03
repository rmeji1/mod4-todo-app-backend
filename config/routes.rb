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

  resources :tasks, only: :show do 
    resources :checklists, only: [:index, :create]
  end
  
  resources :checklists, only: [:show, :destroy, :update] do
    resources :items, only: [:index, :create]
  end

  resources :notes, only: :destroy
  resources :tags, only: [:index] 
  resources :items, only: [:update]
end
