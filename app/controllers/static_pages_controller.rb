class StaticPagesController < ApplicationController
    # 認証を追加
    before_action :authenticate_user!

    # トップメニュー
    def home

    end
end
