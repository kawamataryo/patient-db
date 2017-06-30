class HistoriesController < ApplicationController
    def new
        gon.patients = Patient.all
    end

    def create
        # postの取得
        @history_date = params[:history_date]
        @patient_id = params[:patient_id]
        @sales = params[:sales]

        # 分割取得
        count = 0
        @histories = []
        for patient in @patient_id do
            unless patient == ''
                @histories.push({ history_date: @history_date, patient_id: patient, sales: @sales["#{count}"] })
            end
            count += 1
        end
    end

    def show
    end

    def index
        @histories = History.all
    end

    private
        def history_params
            history_date = params["history_date"]
            patient_id = params["patient_id"]
            sales = params["sales"]
        end
end
