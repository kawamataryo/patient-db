class HistoriesController < ApplicationController
    # 認証を追加
    before_action :authenticate_user!

    # 履歴の追加
    def new
        gon.patients = Patient.all
    end

    # 履歴のDB記録
    def create
        # postの取得
        @history_date = params[:history_date]
        @patient_id = params[:patient_id]
        @sales = params[:sales]

        # DB記録
        count = 0
        for id in @patient_id do
            # idが空行でなかったら保存へ
            unless id == ''
                @history = History.new
                # データ挿入
                @history.history_date = @history_date
                @history.patient_id = id
                @history.patient_name = Patient.find(id).name
                @history.sales = @sales["#{count}"].to_i
                # 保存
                @history.save
            end
            count += 1
        end
    end

    # 履歴の削除
    def destroy
        # レコード削除
        History.find(params[:id]).destroy
        # autoincrementの初期化
        History.reset_pk_sequence

        redirect_to histories_url
    end

    # 履歴一覧
    def index
        # 日付順で並び替えて出力
        @histories = History.order("history_date desc").page(params[:page])
    end

end
