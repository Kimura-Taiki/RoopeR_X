Rails.application.routes.draw do
  get 'positions/index'
  get 'positions/new'
  get 'positions/show'
  get 'positions/edit'
  root to: 'homes#home'
  resources :zas
  resources :categories, only: [:index, :create]
  resources :scripts do
    resources :pawns
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# ちょっと修正してみるよー
# さらに修正してみるよー
# remoteしたアドレスがHTTP系列だったのでSSH系列に変えてみるよー