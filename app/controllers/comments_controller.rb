class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment

  def create
    @comment = @appointment.comments.create(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Comment has been created"
      redirect_to appointment_path(@appointment)
    else
      flash[:alert] = "Comment has not been created"
      redirect_to appointment_path(@appointment)
    end
  end

  def destroy
    @comment = @appointment.comments.find(params[:id])
    @comment.destroy
    redirect_to appointment_path(@appointment)
  end

  private

  def set_appointment
      @appointment = Appointment.find(params[:appointment_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
