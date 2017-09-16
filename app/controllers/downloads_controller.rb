class DownloadsController < ApplicationController

    #downloadpage
    def index
    end

    #downloadcsv
    def yearSales
        #yearの年の売上集計結果を出力
        dw_year = params[:year]
        @day_sales = History.where("history_date like ?", dw_year + "%").group_by_day(:history_date, format: "%Y/%m/%d").sum(:sales)

        #file名を編集
        respond_to do |format|
          format.csv do
              send_data render_to_string, filename: dw_year + "-sales.csv", type: :csv
          end
        end

    end

end
