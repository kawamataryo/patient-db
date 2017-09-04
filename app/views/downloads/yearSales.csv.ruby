require 'csv'

#utf8の文字化け防止
bom = "\uFEFF"
CSV.generate(bom) do |csv|
    csv_column_names = %w(取引No 取引日 借方勘定科目 借方金額(円) 貸方勘定科目 貸方金額(円) 適応)
    csv << csv_column_names
    # Noのcount
    num = 1
    @day_sales.each do |day, sales|
        if sales != 0
            csv_column_values = [
                num,
                day,
                '現金',
                sales,
                '売上',
                sales,
                '施術売上（日集計)'
            ]
            csv << csv_column_values
            num += 1
        end
    end
end
