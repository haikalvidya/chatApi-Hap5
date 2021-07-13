class CreateChatRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_rooms do |t|
      t.string :title
      t.references :sender, null: false, foreign_key: { to_table: :users }
      t.references :recipient, null: false, foreign_key: { to_table: :users }
      t.references :created, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
    add_index :chat_rooms, :title, unique: true
    add_index :chat_rooms, :sender_id
  end
end
