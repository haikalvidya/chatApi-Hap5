class ChatRoomsController < ApplicationController
  include Response
  include ExceptionHandler

  before_action :set_chat_room, only: [:show, :update, :destroy]

  # GET /chat_rooms
  def index
    @chat_rooms = ChatRoom.all

    render json: @chat_rooms
  end

  # GET /chat_rooms/1
  def show
    render json: @chat_room
  end

  # GET /chat_rooms/search?title=Title
  def search
    title = chat_room_params[:title] ? chat_room_params[:title].downcase : ' '
    @chat_rooms = ChatRoom.where("lower(title) LIKE ?", "%#{title}%").map{|x| x.as_json}
    render json: @chat_rooms
  end

  # POST /chat_rooms
  def create
    @chat_room = ChatRoom.new(chat_room_params)

    if @chat_room.save
      render json: @chat_room, status: :created, location: @chat_room
    else
      render json: @chat_room.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /chat_rooms/1
  def update
    if @chat_room.update(chat_room_params)
      render json: @chat_room
    else
      render json: @chat_room.errors, status: :unprocessable_entity
    end
  end

  # DELETE /chat_rooms/1
  def destroy
    @chat_room.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat_room
      @chat_room = ChatRoom.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chat_room_params
      params.permit(:title, :sender_id, :recipient_id, :created_id)
    end
end
