class HistoriesController < ApplicationController
  def new
    gon.patients = Patient.all
  end

  def create
    render plain: params.inspect
  end

  def show
  end

  def index
  end
end
