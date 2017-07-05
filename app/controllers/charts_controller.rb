class ChartsController < ApplicationController
    def show
        # 月別来院件数
        @month_sales = History.group_by_month(:history_date)
        # 月別新規患者
        @new_patient_chart = Patient.group_by_month(:firstday)
        # 男女比
        @sex_chart = Patient.group(:sex).count
        # 鍼灸経験
        @experience_chart = Patient.group(:experience).count
    end
end
