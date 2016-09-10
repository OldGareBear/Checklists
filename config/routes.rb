Checklists::Application.routes.draw do
  get 'welcome/index'

  resource :session, only: [:create, :new, :destroy]

  resource :users

  resources :checklists do
    resources :items
  end

  root 'welcome#index'
end