Checklists::Application.routes.draw do
  get 'welcome/index'

  resource :sessions, only: [:create, :new, :destroy]

  resource :users

  resources :checklists do
    resources :items
  end

  get 'my_checklists' => 'checklists#my_checklists', as: 'my_checklists'
  get 'checklists/:id/add' => 'checklists#add_checklist', as: 'add_checklist'

  root 'welcome#index'
end
