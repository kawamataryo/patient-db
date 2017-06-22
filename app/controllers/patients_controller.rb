class PatientsController < ApplicationController
    def index
        @patients = Patient.page(params[:page])
    end

    def new
        @patient = Patient.new
    end
end
