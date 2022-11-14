class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_appointmentpointment, only: %i(update destroy)

  def new
    @appointment = Appointment.new
    @doctors = Doctor.where(role: ['doctor']).all
    @patients = current_user.id
  end

  def index
  end

  def create
    @appointment = Appointment.new appointment_params
    if @appointment.save
      flash[:success] = "appointment_created"
      redirect_to root_url
    else
      flash[:notice] = "appointment_not_created"
      render :new
    end
  end

  def update
    if @appointment.update(appointment_params)
      flash[:notice] = "appointment has been updated"
    else
      render :edit
    end
    redirect_to appointments_path
  end

  def destroy
    if @appointment.destroy
      flash[:success] = t "appointment_canceled"
      redirect_to request.referer || root_url
    else
      flash[:notice] = t "not_success"
      redirect_to root_url
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:message, :doctor_id, :patient_id)
  end

  def find_appointmentpointment
    @appointment = current_user.appointment.find(params[:id])
    return if @appointment

    flash[:danger] = t "not_found"
    redirect_to root_url
  end  
end
