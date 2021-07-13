class MessagesController < ActionController::API
  include Response
  include ExceptionHandler

  before_action :set_chat_room
  before_action :set_chat_room_message, only: [:show, :update, :destroy]

  # GET /chat_rooms/:chat_room_id/messages
  def index
    json_response(@chat_room.messages)
  end

  # GET /chat_rooms/:chat_room_id/messages/search?user_id=id
  def search
    @messages = @chat_room.messages.find_by!(user_id: message_params[:user_id])
    json_response(@messages)
  end

  # GET /chat_rooms/:chat_room_id/messages/:id
  def show
    json_response(@message)
  end

  # POST /chat_rooms/:chat_room_id/messages
  def create
    if message_params[:user_id].to_i == @chat_room.sender_id or message_params[:user_id].to_i == @chat_room.recipient_id
      @message = @chat_room.messages.create!(message_params)
      json_response(@message, :created)
    else
      json_response({ "message": "user_id cant create chat in this room" }, :unprocessable_entity)
    end
  end

  # PUT /chat_rooms/:chat_room_id/messages/:id
  def update
    if message_params[:user_id].to_i == @chat_room.sender_id or message_params[:user_id].to_i == @chat_room.recipient_id
      @message.update(message_params)
      head :no_content
    else
      json_response({ "message": "user_id cant create chat in this room" }, :unprocessable_entity)
    end
  end

  # DELETE /chat_rooms/:chat_room_id/messages/:id
  def destroy
    @message.destroy
    head :no_content
  end

  private

  def message_params
    params.permit(:body, :chat_room_id, :user_id)
  end

  def set_chat_room
    @chat_room = ChatRoom.find(params[:chat_room_id])
  end

  def set_chat_room_message
    @message = @chat_room.messages.find_by!(id: params[:id]) if @chat_room
  end

end