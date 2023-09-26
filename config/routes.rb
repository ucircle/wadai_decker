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
  resources :customers, only: [:show] do
      get 'bookmarks', on: :member
    end
  resources :genres do
    member do
      post :create_topic # 新しいトピックを作成するアクションに対応するルートを追加
    end
    resources :topics, only: [:new, :create, :index, :show, :update] do
      member do
        get :random_topics # ランダムなトピックを表示するためのルートを追加
      end
      member do
        delete 'remove_tag', to: 'topics#remove_tag'
      end
      resources :comments, only: [:index, :create, :destroy]
      resources :bookmarks, only: [:create, :destroy]
    end
  end

end
# Admin routes
  namespace :admin do
    root to: "public/genres#index"
    resources :topics do
      resources :comments, only: [:index, :destroy]
    end
    resources :genres
  end
end
