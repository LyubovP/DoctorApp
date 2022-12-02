class Comment < ApplicationRecord
  belongs_to :appointment
  belongs_to :user
  has_rich_text :body
end
