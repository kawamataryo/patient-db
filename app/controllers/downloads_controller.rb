class DownloadsController < ApplicationController
  def index
    @day_sales = History.group_by_day(:history_date, format: "%Y/%m/%d").sum(:sales)
  end

end
