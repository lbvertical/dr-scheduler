class DoctorsController < ApplicationController
    before_action :set_course, only: [:show]
  
  def index
    @doctors = Doctors.all
  end

  def show
  
  end

  def new
    @doctor = Doctors.new
  end

  private 
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    def doctor_params
      params.require(:doctor).permit(:name)
    end
end
