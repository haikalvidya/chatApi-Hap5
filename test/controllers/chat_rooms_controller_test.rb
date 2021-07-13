require "test_helper"

class ChatRoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chat_room = chat_rooms(:one)
  end

  test "should get index" do
    get chat_rooms_url, as: :json
    assert_response :success
  end

  test "should create chat_room" do
    assert_difference('ChatRoom.count') do
      post chat_rooms_url, params: { chat_room: { created_id: @chat_room.created_id, recipient_id: @chat_room.recipient_id, sender_id: @chat_room.sender_id, title: @chat_room.title } }, as: :json
    end

    assert_response 201
  end

  test "should show chat_room" do
    get chat_room_url(@chat_room), as: :json
    assert_response :success
  end

  test "should update chat_room" do
    patch chat_room_url(@chat_room), params: { chat_room: { created_id: @chat_room.created_id, recipient_id: @chat_room.recipient_id, sender_id: @chat_room.sender_id, title: @chat_room.title } }, as: :json
    assert_response 200
  end

  test "should destroy chat_room" do
    assert_difference('ChatRoom.count', -1) do
      delete chat_room_url(@chat_room), as: :json
    end

    assert_response 204
  end
end
