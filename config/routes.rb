Rails.application.routes.draw do
  root to: 'homes#home'
  get "homes/csv", to: "homes#csv"
  get "homes/jspull"
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
    resources :incidents, shallow: true
  end
  # Pawnリソースで浅いネストへ挑戦。コレクション系統とメンバー系統を分割し、:idを持たないコレクション系統のみネストさせる
  get "rules/all"     , to: "rules#index_all"     , as: "all_rules"
  get "positions/all" , to: "positions#index_all" , as: "all_positions"
  get "crimes/all"    , to: "crimes#index_all"    , as: "all_crimes"
  resources :packages, only: [:index, :show] do
    resources :rules, shallow: true, only: [:index, :show]
    resources :positions, shallow: true, only: [:index, :show]
    resources :crimes, shallow: true, only: [:index, :show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# ちょっと修正してみるよー
# さらに修正してみるよー
# remoteしたアドレスがHTTP系列だったのでSSH系列に変えてみるよー