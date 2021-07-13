class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :body
      t.references :user, null: false, foreign_key:  { to_table: :users }
      t.references :chat_room, null: false, foreign_key:  { to_table: :chat_rooms }

      t.timestamps
    end
  end
end
