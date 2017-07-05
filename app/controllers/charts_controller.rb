class ChartsController < ApplicationController
    def show
        # 月別来院件数
        @month_sales = History.group_by_month(:history_date).count
        # 月別新規患者
        @new_patient_chart = Patient.group_by_month(:firstday, format: "%Y年%b").count
        # 男女比
        @sex_chart = Patient.group(:sex).count
        # 鍼灸経験
        @experience_chart = Patient.group(:experience).count
        # 月別来院件数
        @reason_pie_chart = Patient.group(:reason).count
        # 来院理由
        reason_internet = Patient.where(:reason => "ホームページ").group_by_month(:firstday).count
        reason_mouth = Patient.where(:reason => "口コミ").group_by_month(:firstday).count
        reason_flier = Patient.where(:reason => "チラシ").group_by_month(:firstday).count
        reason_know = Patient.where(:reason => "知人").group_by_month(:firstday).count
        @reason_line_chart = [   {"name" => "ホームページ", "data" => reason_internet},
                            {"name" => "口コミ", "data" => reason_mouth},
                            {"name" => "チラシ", "data" => reason_flier},
                            {"name" => "知人", "data" => reason_know}   ]
    end
end
