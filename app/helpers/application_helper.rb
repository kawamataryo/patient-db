module ApplicationHelper

    #----------------------------------------------------
    #電話番号形式変換
    #----------------------------------------------------
    def phone_number_format(number)
        if number.length == 11
            number.gsub(/(\d{3})(\d{4})(\d{4})/,'\1-\2-\3')
        elsif number.length == 10
            number.gsub(/(\d{3})(\d{3})(\d{4})/,'\1-\2-\3')
        else
            number
        end
    end
    #----------------------------------------------------
    #年齢計算
    #----------------------------------------------------
    require 'date'
    def age(birthday)
        if birthday
            ((Date.today.strftime("%Y%m%d").to_i - birthday.strftime("%Y%m%d").to_i) / 10000).to_s + '歳'
        end
    end

end
