class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_appointment, only: %i(edit show update)
  load_and_authorize_resource

  def index
    @appointments = User.find_by_id(current_user).appointments
  end
  
  def show
    @comments = @appointment.comments.order(created_at: :desc)
    mark_notifications_as_read
  end

  def new
    @appointment = Appointment.new
    @doctor = Doctor.all
  end

  def edit
  end

  def create
    @appointment = Appointment.new appointment_params
    if @appointment.save
      flash[:success] = "Appointment Created"
      redirect_to appointments_url(@appointment)
    else
      flash[:notice] = "Something went wrong while trying to create appointment"
      render :new
    end
  end

  def update
    if @appointment.update(appointment_params)
      flash[:notice] = "Appointment has been Updated"
    else
      render :edit
    end
    redirect_to appointments_path
  end

  def destroy
    if @appointment.destroy
      flash[:success] = "Appointment Deleted"
      redirect_to appointments_path
    else
      flash[:notice] = "Appointment deletion was unsuccessful"
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

    flash[:danger] = t "Appointment finding was unsuccessful"
    redirect_to root_url
  end

  def mark_notifications_as_read
    if current_user
      notifications_to_mark_as_read = @appointment.notifications_as_appointment.where(recipient: current_user)
      notifications_to_mark_as_read.update_all(read_at: Time.zone.now)
    end
  end
end
