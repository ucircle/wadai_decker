Rails.application.routes.draw do
# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
# Public routes
  scope module: :public do
  root to: "genres#index"
  resources :genres do
    resources :topics, only: [:new, :create, :index, :show] do
      resources :comments, only: [:index, :create]
    end
  end
  
end
# Admin routes
  namespace :admin do
    get "/" => "genres#index"
    resources :topics
    resources :genres
  end
end
