Rails.application.routes.draw do

  get 'downloads/index'

    #グラフ
    get 'charts/show'

    # 認証
    devise_for :users

    # トップページ
    root 'static__pages#home'

    # 患者名簿検索
    get '/patients/search', to: 'patients#search', as: 'search'

    # 患者登録
    resources :patients

    # 履歴登録
    resources :histories
end
