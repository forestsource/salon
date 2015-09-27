Salon::Application.routes.draw do
  get "staffs/index"

  get "shifts/search"

  get "shifts/index"

  get "shifts/new"

  get "shifts/show"

  get "members/search"

  get "members/index"

  get "members/new"

  get "members/edit"

  get "members/show"

  get "members/update"

  get "top/index"

  get "reserves/index"

  get "reserves/show"

  get "reserves/search"

  get "menus/index"

  get "menus/create"

  get "menus/new"

  get "menus/destroy"

  get "menus/edit"

  get "menus/show"

  get "menus/update"

  root to: "top#index"

  resource :session,only: [:create, :destroy]
  resources :members,only: [:new, :create] do
    collection {get "check"}
  end
  resource :account,only: [:show, :edit, :update] do
    collection {get "check"}
  end
  resources :staffs,only: [:index]
  resources :reserves do
    collection {get "search"}
    collection {get "check"}
  end
  resources :menus,only: [:index]

  namespace :admin do
    root to: "top#index"
    resources :members do
      collection {get "search"}
      collection {get "check"}
    end
    resources :shifts do
      collection {get "search"}
      collection {get "check"}
    end
    resources :menus do
      collection {post "check"}
    end
    resources :staffs do
      collection {post "check"}
    end
    resources :reserves,only: [:index, :show] do
      collection {get "search"}
    end
  end

  namespace :clerk do
    root to: "top#index"
    resources :members,except: [:create, :destroy] do
      collection {get "search"}
    end
    resources :shifts do
      collection {get "search"}
      collection {get "check"}
    end
    resources :menus,only: [:index]
    resources :staffs,only: [:index]
    resources :reserves,only: [:index, :show] do
      collection {get "search"}
    end
  end
end
