class HistoriesController < ApplicationController
    # 認証を追加
    before_action :authenticate_user!

    # 履歴の追加
    def new
        gon.patients = Patient.all
        @history = History.new
    end

    # 履歴のDB記録
    def create
        # postの取得
        @history_date = params[:history_date]
        @patient_id = params[:patient_id]
        @sales = params[:sales]

        # DB記録
        count = 0
        success = 0
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
                if @history.save
                    success += 1
                else
                    # newへ戻る
                    render 'new'
                end
            end
            count += 1
        end

        # リダイレクト
        if success > 0
            flash[:info] = "#{@history_date} の来院履歴 #{success} 件の追加完了しました。"
            redirect_to action: 'index'
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

    # 履歴編集
    def edit
        @history = History.find(params[:id])
    end


    # 履歴の修正をDBへ反映
    def update
        @history = History.find(params[:id])
        if @history.update_attributes(history_params)
            redirect_to histories_url
        else
            render 'edit'
        end
    end

    # フォーム受け取り要素の選別
    private
    def history_params
        params.require(:history).permit(:history_date, :patient_id, :patient_name, :sales)
    end
end
