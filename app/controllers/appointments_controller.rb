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
      redirect_to doctor_path(@doctor)
    else
      render :new
    end  
  end

  def update
    if @appointment.update(appointment_params)
    redirect_to doctor_path(@doctor)
    else
      render :edit
    end
  end

  def destroy
    Appointments.find(params[:id]).destroy
    redirect_to doctor_path(@doctor)
  end

  private
  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:body, :doctor_id, :patient_id)
  end
end
