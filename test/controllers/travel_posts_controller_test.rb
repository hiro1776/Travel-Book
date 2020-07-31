require 'test_helper'

class TravelPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @travel_post = travel_posts(:one)
  end

  test "should get index" do
    get travel_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_travel_post_url
    assert_response :success
  end

  test "should create travel_post" do
    assert_difference('TravelPost.count') do
      post travel_posts_url, params: { travel_post: { body: @travel_post.body, title: @travel_post.title } }
    end

    assert_redirected_to travel_post_url(TravelPost.last)
  end

  test "should show travel_post" do
    get travel_post_url(@travel_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_travel_post_url(@travel_post)
    assert_response :success
  end

  test "should update travel_post" do
    patch travel_post_url(@travel_post), params: { travel_post: { body: @travel_post.body, title: @travel_post.title } }
    assert_redirected_to travel_post_url(@travel_post)
  end

  test "should destroy travel_post" do
    assert_difference('TravelPost.count', -1) do
      delete travel_post_url(@travel_post)
    end

    assert_redirected_to travel_posts_url
  end
end
