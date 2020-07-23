require "application_system_test_case"

class TravelPostsTest < ApplicationSystemTestCase
  setup do
    @travel_post = travel_posts(:one)
  end

  test "visiting the index" do
    visit travel_posts_url
    assert_selector "h1", text: "Travel Posts"
  end

  test "creating a Travel post" do
    visit travel_posts_url
    click_on "New Travel Post"

    fill_in "Body", with: @travel_post.body
    fill_in "Title", with: @travel_post.title
    click_on "Create Travel post"

    assert_text "Travel post was successfully created"
    click_on "Back"
  end

  test "updating a Travel post" do
    visit travel_posts_url
    click_on "Edit", match: :first

    fill_in "Body", with: @travel_post.body
    fill_in "Title", with: @travel_post.title
    click_on "Update Travel post"

    assert_text "Travel post was successfully updated"
    click_on "Back"
  end

  test "destroying a Travel post" do
    visit travel_posts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Travel post was successfully destroyed"
  end
end
