Rails.application.routes.draw do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    # トップページ
    root 'static__pages#home'

    # 患者登録
    resources :patients

    # 履歴登録
    resources :histories
end
