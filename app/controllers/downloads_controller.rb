class DownloadsController < ApplicationController

    require 'time'

    #downloadpage
    def index
    end

    #downloadcsv
    def yearSales
        # 受けった年をparseする
        dw_year = params[:year]
        first_day = Time.parse(dw_year + "-01-01")
        last_day = Time.parse(dw_year + "-12-31")

        #yearの年の売上集計結果を出力
        @day_sales = History.where(history_date: first_day..last_day).group_by_day(:history_date, format: "%Y/%m/%d").sum(:sales)

        #file名を編集
        respond_to do |format|
          format.csv do
              send_data render_to_string, filename: dw_year + "-sales.csv", type: :csv
          end
        end

    end

end
