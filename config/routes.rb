Rails.application.routes.draw do
  root to: 'rentals#index'
  resources :rentals do  
  # ルーティングはコントローラへの振り分けなのでモデル名ではなくコントローラ名で振り分け実行
    collection do
      post :confirm
    end
  end
  resources :properties  # resources :nearest_stationsではない
end
