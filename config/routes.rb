Checklists::Application.routes.draw do
  get 'welcome/index'

  resource :sessions, only: [:create, :new, :destroy]

  resource :users

  resources :checklists do
    resources :items
  end

  get 'my_checklists' => 'checklists#my_checklists', as: 'my_checklists'

  root 'welcome#index'
end
