class ChartsController < ApplicationController
    # 認証を追加
    before_action :authenticate_user!

    def show

        #------------------------------------------------------------------
        # 年別売上高
        #------------------------------------------------------------------
        @year_sales = History.group_by_year(:history_date, format: "%Y年").sum(:sales)

        #------------------------------------------------------------------
        # 月別来院件数
        #------------------------------------------------------------------
        @month_patient = History.group_by_month(:history_date, format: "%Y年%b").count

        #------------------------------------------------------------------
        # 月別新規患者
        #------------------------------------------------------------------
        @new_patient_chart = Patient.group_by_month(:firstday, format: "%Y年%b").count

        #------------------------------------------------------------------
        # 男女比
        #------------------------------------------------------------------
        @sex_chart = Patient.group(:sex).count

        #------------------------------------------------------------------
        # 鍼灸経験
        #------------------------------------------------------------------
        @experience_chart = Patient.group(:experience).count

        #------------------------------------------------------------------
        # 月別来院件数
        #------------------------------------------------------------------
        @reason_pie_chart = Patient.group(:reason).count

        #------------------------------------------------------------------
        # 地域別患者割合
        #------------------------------------------------------------------
        a_hitachinaka = Patient.where('address like(?)', "%ひたちなか%").count
        a_mito = Patient.where('address like(?)', "%水戸%").count
        a_naka = Patient.where('address like(?)', "%那珂%").count
        a_tokai = Patient.where('address like(?)', "%東海%").count
        a_hitatchi = Patient.where('address like(?)', "%日立%").count
        a_oarai = Patient.where('address like(?)', "%大洗%").count
        a_other = Patient.count - a_hitachinaka - a_hitatchi - a_naka - a_tokai - a_oarai
        @address_pie_chart = {
            "ひたちなか" => a_hitachinaka,
            "水戸" => a_mito,
            "那珂" => a_naka,
            "東海" => a_tokai,
            "日立" => a_hitatchi,
            "大洗" => a_oarai,
            "その他" => a_other,
        }

        #------------------------------------------------------------------
        # 来院理由
        #------------------------------------------------------------------
        reason_internet = Patient.where(:reason => "ホームページ").group_by_month(:firstday).count
        reason_mouth = Patient.where(:reason => "口コミ").group_by_month(:firstday).count
        reason_flier = Patient.where(:reason => "チラシ").group_by_month(:firstday).count
        reason_know = Patient.where(:reason => "知人").group_by_month(:firstday).count
        @reason_line_chart = [   {"name" => "ホームページ", "data" => reason_internet},
                            {"name" => "口コミ", "data" => reason_mouth},
                            {"name" => "チラシ", "data" => reason_flier},
                            {"name" => "知人", "data" => reason_know}   ]

        #------------------------------------------------------------------
        # 年齢別患者数
        #------------------------------------------------------------------
        birthday_column = Patient.pluck(:birthdate) # 生年月日の配列を取得
        @ages_chart = {"10代以下" => 0,"20代" => 0, "30代" => 0, "40代" => 0, "50代" => 0, "60代" => 0, "70代" => 0, "80代以上" => 0}
        birthday_column.each do |birthdate| # 年齢区分ごとに集計
            age = age_cal(birthdate)
            case age
            when 0..19
                @ages_chart["10代以下"] += 1
            when 20..29
                @ages_chart["20代"] += 1
            when 30..39
                @ages_chart["30代"] += 1
            when 40..49
                @ages_chart["40代"] += 1
            when 50..59
                @ages_chart["50代"] += 1
            when 60..69
                @ages_chart["60代"] += 1
            when 70..79
                @ages_chart["70代"] += 1
            else
                @ages_chart["80代以上"] += 1
            end
        end

        #------------------------------------------------------------------
        # 年齢区分別広告効果
        #------------------------------------------------------------------
        # 変数設定
        age_reason_sum = [ {"10代以下" => 0,"20代" => 0, "30代" => 0, "40代" => 0, "50代" => 0, "60代" => 0, "70代" => 0, "80代以上" => 0},
                           {"10代以下" => 0,"20代" => 0, "30代" => 0, "40代" => 0, "50代" => 0, "60代" => 0, "70代" => 0, "80代以上" => 0},
                           {"10代以下" => 0,"20代" => 0, "30代" => 0, "40代" => 0, "50代" => 0, "60代" => 0, "70代" => 0, "80代以上" => 0},
                           {"10代以下" => 0,"20代" => 0, "30代" => 0, "40代" => 0, "50代" => 0, "60代" => 0, "70代" => 0, "80代以上" => 0} ]
        age_reason_cate = [ Patient.where(:reason => "ホームページ").pluck(:birthdate),
                            Patient.where(:reason => "口コミ").pluck(:birthdate),
                            Patient.where(:reason => "チラシ").pluck(:birthdate),
                            Patient.where(:reason => "知人").pluck(:birthdate) ]
        # 集計
        age_reason_sum.zip(age_reason_cate).each do |age_sum, cate| #それぞれの配列を実行
            cate.each do |birthdate| # 年齢区分ごとに集計
                age = age_cal(birthdate)
                case age
                when 0..19
                    age_sum["10代以下"] += 1
                when 20..29
                    age_sum["20代"] += 1
                when 30..39
                    age_sum["30代"] += 1
                when 40..49
                    age_sum["40代"] += 1
                when 50..59
                    age_sum["50代"] += 1
                when 60..69
                    age_sum["60代"] += 1
                when 70..79
                    age_sum["70代"] += 1
                else
                    age_sum["80代以上"] += 1
                end
            end
        end
        # viewへ送る
        @age_reason_chart = [   {"name" => "ホームページ", "data" => age_reason_sum[0]},
                                {"name" => "口コミ", "data" => age_reason_sum[1]},
                                {"name" => "チラシ", "data" => age_reason_sum[2]},
                                {"name" => "知人", "data" =>age_reason_sum[3]} ]

        #------------------------------------------------------------------
        # 症状の分布
        #------------------------------------------------------------------
        # 症例の検索
        @symptom_pie_chart = {}
        Settings.symptom.split(' ').each do |sym|
            @symptom_pie_chart[sym] = Patient.where('symptom like(?)', "%#{sym}%").count
        end

    end

    #------------------------------------------------------------------
    # 独自関数
    #------------------------------------------------------------------
    private
        # 誕生日から年齢計算
        def age_cal(birthdate)
            date_format = "%Y%m%d"
            (Date.today.strftime(date_format).to_i - birthdate.to_s.gsub!(/-/,'').to_i) / 10000
        end
end
