class AddChatRoomIdToMessages < ActiveRecord::Migration[6.1]
  def change
    add_reference :messages, :chat_room, foreign_key: true
  end
end