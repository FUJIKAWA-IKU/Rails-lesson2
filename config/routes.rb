Rails.application.routes.draw do
  post 'reservation/:room_id/create', to:'reservation#create' #予約実行

  get 'users/new', to:'users#new' #アカウント新規登録フォーム表示
  get 'users/login', to:'users#login_form' #ログインフォーム表示
  post 'users/login', to:'users#login' #ログイン
  get 'users/logout', to:'users#logout' #ログアウト
  post 'users/create', to:'users#create' #アカウント新規登録
  get 'users/:id/account', to:'users#account' #アカウント詳細
  get 'users/:id/edit', to:'users#edit' #アカウント編集
  post 'users/update', to:'users#update' #アカウント更新
  get 'users/:id/reservations', to:'users#reservations' #予約済みルーム一覧
  get 'users/:id', to:'users#show' #登録済みルーム一覧
  
  get 'rooms/new', to:'rooms#new' #ルーム新規登録フォーム表示
  post 'rooms/create', to:'rooms#create' #ルーム新規登録
  get 'rooms/search_area', to:'rooms#search_area' #「場所で検索」結果
  get 'rooms/search_keyword', to:'rooms#search_keyword' #「キーワードで検索」結果
  get 'rooms/:id', to:'rooms#show' #ルーム詳細

  get '/', to:'home#top' #トップページ
  get 'home/top', to:'home#top' #トップページ
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
