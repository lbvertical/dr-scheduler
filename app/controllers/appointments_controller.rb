class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]


def index
    @appointments = Appointment.all
  end

  def show
  end

  def new
    @doctors = Doctor.all
    @patients = Patient.all
    @appointment = Appointment.new
  end

  def edit
  end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      redirect_to appointments_path
    else
      render :new
    end  
  end

  def update
    if @appointment.update(appointment_params)
    redirect_to appointments_path
    else
      render :edit
    end
  end

  def destroy
    Appointment.find(params[:id]).destroy
    redirect_to appointments_path
  end

  private
  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
    @doctors = Doctor.all
  end

  def appointment_params
    params.require(:appointment).permit(:id, :body, :doctor_id, :patient_id, :appointment_date)
  end
end
