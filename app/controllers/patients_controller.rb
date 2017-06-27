class PatientsController < ApplicationController
    # 患者名簿一覧
    def index
        @patients = Patient.page(params[:page])
    end

    # 患者情報追加
    def new
        @patient = Patient.new
    end

    # 患者情報の追加をDBヘ
    def create
        @patient = Patient.new(patient_params)
        if @patient.save
            redirect_to @patient
        else
            render 'new'
        end
    end

    # 患者情報個別
    def show
        @patient = Patient.find(params[:id])
    end

    # 患者情報個別
    def edit
        @patient = Patient.find(params[:id])
    end


    # フォーム受け取り要素の選別
    private
        def patient_params
            params.require(:patient).permit(:name, :kana, :sex, :birthdate, :phone,
                                            :postCode, :address, :reason, :experience,
                                            :firstDay, :memo)
        end
end
