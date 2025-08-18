class ChatRoomsController < ApplicationController
  before_action :require_login
  before_action :set_chat_room, only: [:show]

  def index
    @chat_rooms = if current_user.is_a?(Organization)
                    current_user.chat_rooms.order(created_at: :desc)
                  elsif current_user.is_a?(Client)
                    current_user.chat_rooms.distinct.order(created_at: :desc)
                  else
                    []
                  end
  end

  def show
    # @chat_room is set by before_action
    @messages = @chat_room.messages.order(:created_at)
    @message = @chat_room.messages.new
  end

  private

  def set_chat_room
    @chat_room = ChatRoom.find_by(id: params[:id])
    unless @chat_room
      redirect_to chat_rooms_path, alert: "Chat room not found"
    end
  end
end
