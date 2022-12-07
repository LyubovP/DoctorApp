class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_appointment, only: %i(edit show update)

  def index
    if  @appointments = Appointment.where(:patient_id => current_user.id)
    else
    @appointments = Appointment.where(:doctor_id => current_user.id)
    end
  end
  
  def show
    @comments = @appointment.comments.order(created_at: :desc)
    mark_notifications_as_read
  end

  def new
    @appointment = Appointment.new
    @doctors = Doctor.where(role: ['doctor']).all
    @patients = current_user.id
  end

  def edit
    @doctors = Doctor.where(role: ['doctor']).all
    @patients = current_user.id
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
    if Appointment.delete(params[:id])
      flash[:success] = t "appointment_canceled"
      redirect_to appointments_path
    else
      flash[:notice] = t "not_success"
      redirect_to root_url
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:message, :doctor_id, :patient_id)
  end

  def find_appointment
    @appointment = Appointment.find(params[:id])
    
    return if @appointment

    flash[:danger] = t "not_found"
    redirect_to root_url
  end

  def mark_notifications_as_read
    if current_user
      notifications_to_mark_as_read = @appointment.notifications_as_appointment.where(recipient: current_user)
      notifications_to_mark_as_read.update_all(read_at: Time.zone.now)
    end
  end
end
