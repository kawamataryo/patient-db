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
        history_date = params[:history_date]
        patient_id = params[:patient_id]
        patient_name = params[:patient_name]
        sales = params[:sales]

        # DB記録
        count = 0
        success = 0
        for id in patient_id do
            # idが空行でなかったら保存へ
            unless id == ''
                @history = History.new
                # データ挿入
                @history.history_date = history_date
                @history.patient_id = id
                @history.patient_name = patient_name[count]
                @history.sales = sales["#{count}"].to_i
                # 保存
                if @history.save
                    # 登録結果表示用
                    success += 1
                else
                    # newへ戻る
                    gon.patients = Patient.all
                    render 'new'
                end
            end
            count += 1
        end

        # リダイレクト
        if success > 0
            flash[:info] = "#{@history.history_date.strftime("%Y年%-m月%-d日")} の来院履歴 #{success} 件の追加完了しました。"
            redirect_to action: 'index'
        end
    end

    # 履歴の削除
    def destroy
        # メッセージの格納
        flash[:deleat_ok] = "#{History.find(params[:id]).history_date}  #{History.find(params[:id]).patient_name}さんの来院履歴を削除しました。"

        # レコード削除
        History.find(params[:id]).destroy

        # 一覧へのリダイレクト
        redirect_to histories_url
    end

    # 履歴一覧
    def index
        # ransack
        @q = History.ransack(params[:q])
        # 日付で並び変え
        @q.sorts = 'history_date desc'
        @histories = @q.result.page(params[:page])
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
