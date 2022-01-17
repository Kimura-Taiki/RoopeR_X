Rails.application.routes.draw do
  root to: 'homes#home'
  get "homes/csv", to: "homes#csv"
  resources :zas do
    get "category_x", on: :new
  end
  resources :categories, only: [:index, :new, :create]
  # resources :scripts do
  #   resources :pawns, only: [:index, :new, :create]
  # end
  # resources :pawns, only: [:show, :edit, :update, :destroy]
  resources :scripts do
    resources :pawns, shallow: true
  end
  # Pawnリソースで浅いネストへ挑戦。コレクション系統とメンバー系統を分割し、:idを持たないコレクション系統のみネストさせる
  resources :positions
  resources :rules
  resources :crimes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# ちょっと修正してみるよー
# さらに修正してみるよー
# remoteしたアドレスがHTTP系列だったのでSSH系列に変えてみるよー