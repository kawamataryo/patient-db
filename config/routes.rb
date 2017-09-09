Rails.application.routes.draw do


    # downloads page
    get 'downloads/index'

    # downloads sales
    get 'downloads/yearSales'

    #グラフ
    get 'charts/show'

    # 認証
    devise_for :users

    # 認証されていないユーザーのホーム
    unauthenticated do
        as :user do
            root to: 'devise/sessions#new'
        end
    end

    # 認証されているユーザーのホーム
    root to: 'static_pages#home'


    # 患者名簿検索
    get '/patients/search', to: 'patients#search', as: 'search'

    # 患者登録
    resources :patients

    # 履歴登録
    resources :histories
end
