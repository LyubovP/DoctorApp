# == Schema Information
#
# Table name: comments
#
#  id             :bigint           not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  appointment_id :bigint           not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_comments_on_appointment_id  (appointment_id)
#  index_comments_on_user_id         (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (appointment_id => appointments.id)
#  fk_rails_...  (user_id => users.id)
#
class Comment < ApplicationRecord
  belongs_to :appointment
  belongs_to :user
  has_rich_text :body

  after_create_commit :notify_recipient
  before_destroy :cleanup_notifications
  has_noticed_notifications model_name: 'Notification'

  private

  def notify_recipient
    CommentNotification.with(comment: self, appointment: appointment).deliver_later(appointment.patient)
    CommentNotification.with(comment: self, appointment: appointment).deliver_later(appointment.doctor)# doctor 
  end

  def cleanup_notifications
    notifications_as_comment.destroy_all
  end
end
