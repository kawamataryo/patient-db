Rails.application.routes.draw do
  devise_for :users
  get 'histories/new'

  get 'histories/show'

  get 'histories/index'

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    # トップページ
    root 'static__pages#home'

    # 患者名簿検索
    get '/patients/search', to: 'patients#search', as: 'search'

    # 患者登録
    resources :patients

    # 履歴登録
    resources :histories
end
