# app/channels/chat_channel.rb
class ChatChannel < ApplicationCable::Channel
  def subscribed
    chat_room = ChatRoom.find(params[:id])
    stream_for chat_room
  end
end