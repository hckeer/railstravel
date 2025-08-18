class CreateChatRooms < ActiveRecord::Migration[7.2]
  def change
    create_table :chat_rooms do |t|
      t.string :title
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
