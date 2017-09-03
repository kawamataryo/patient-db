class DownloadsController < ApplicationController

    #downloadpage
    def index
    end

    #downloadcsv
    def yearSales
        dw_year = params[:year]
        @day_sales = History.where("history_date like '" + dw_year + "%'").group_by_day(:history_date, format: "%Y/%m/%d").sum(:sales)
    end

end
