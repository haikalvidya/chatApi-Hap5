class ChatRoom < ApplicationRecord
  belongs_to :sender, class_name: :User, foreign_key: :sender_id
  belongs_to :recipient, class_name: :User, foreign_key: :recipient_id
  belongs_to :created,  class_name: :User, foreign_key: :created_id

  has_many :messages, dependent: :destroy
end
