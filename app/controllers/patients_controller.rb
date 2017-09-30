class PatientsController < ApplicationController
    # 認証を追加
    before_action :authenticate_user!

    # 患者名簿一覧
    def index
        @q = Patient.ransack(params[:q])
        @patients = @q.result().page(params[:page])
    end

    # 患者名簿検索
    def search
        gon.patients = Patient.all
    end

    # 患者情報追加
    def new
        @patient_id_defo = Patient.maximum(:patient_id) + 1
        @patient = Patient.new
    end

    # 患者情報の追加をDBヘ
    def create
        #送信データをnew
        @patient = Patient.new(patient_params)
        #症状の配列を空白区切りの文字列に変換
        @patient.symptom = patient_params[:symptom].join(', ')
        if @patient.save
            flash[:info] = "#{@patient.name}さんの登録が完了しました。"
            redirect_to @patient
        else
            @patient_id_defo = Patient.new(patient_params).patient_id #formでvalueに初期値を設定しているのでその関係で
            render 'new'
        end
    end

    # 患者情報個別
    def show
        @patient = Patient.find(params[:id])
    end

    # 患者情報修正
    def edit
        @patient = Patient.find(params[:id])
        @patient_id_defo = Patient.find(params[:id]).patient_id #formでvalueに初期値を設定しているのでその関係で
    end

    # 患者情報の修正をDBへ反映
    def update
        @patient = Patient.find(params[:id])
        if @patient.update_attributes(patient_params)
            redirect_to @patient
        else
            render 'edit'
        end
    end

    # 患者情報の削除
    def destroy
        #レコード削除
        Patient.find(params[:id]).destroy
        # メッセージの格納
        flash[:info] = "患者ID#{Patient.with_deleted.find(params[:id]).patient_id}  #{Patient.with_deleted.find(params[:id]).name}さんの削除が完了しました。"
        redirect_to patients_url
    end


    # フォーム受け取り要素の選別
    private
        def patient_params
            para = params.require(:patient).permit(:patient_id, :name, :kana, :sex, :birthdate, :phone,
                                            :post_code, :address, :reason, :experience, :email,
                                            :firstday, :memo, symptom: [])
            #配列要素を文字列に変換
            para[:symptom] = para[:symptom].join(', ')

            return para
        end
end
