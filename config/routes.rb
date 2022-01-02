Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  
    #ルーティングをネスト（入れ子）にすることで、親子関係をルーティングで表すことができます。
    resources :list, only: %i(new create edit update destroy) do
    #今回はindexアクションを使っていないので、exceptオプションを使ってindexアクションを生成しないように指示します。
    resources :card, except: %i(index)
  end
  
end
