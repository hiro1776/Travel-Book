require 'test_helper'

class PostHistorysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get post_historys_index_url
    assert_response :success
  end

  test "should get show" do
    get post_historys_show_url
    assert_response :success
  end

  test "should get edit" do
    get post_historys_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get post_historys_destroy_url
    assert_response :success
  end

  test "should get update" do
    get post_historys_update_url
    assert_response :success
  end

end
