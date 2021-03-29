require "test_helper"

class OrderItemControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get order_item_create_url
    assert_response :success
  end

  test "should get update" do
    get order_item_update_url
    assert_response :success
  end

  test "should get destroy" do
    get order_item_destroy_url
    assert_response :success
  end
end
