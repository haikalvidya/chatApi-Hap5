class User < ApplicationRecord
    has_many :chat_rooms, foreign_key: :sender_id
end
