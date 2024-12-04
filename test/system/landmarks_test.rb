require "application_system_test_case"

class LandmarksTest < ApplicationSystemTestCase
  setup do
    @landmark = landmarks(:one)
  end

  test "visiting the index" do
    visit landmarks_url
    assert_selector "h1", text: "Landmarks"
  end

  test "should create landmark" do
    visit landmarks_url
    click_on "New landmark"

    fill_in "Description", with: @landmark.description
    fill_in "Latitude", with: @landmark.latitude
    fill_in "Longitude", with: @landmark.longitude
    fill_in "Name", with: @landmark.name
    fill_in "Region", with: @landmark.region_id
    fill_in "User", with: @landmark.user_id
    click_on "Create Landmark"

    assert_text "Landmark was successfully created"
    click_on "Back"
  end

  test "should update Landmark" do
    visit landmark_url(@landmark)
    click_on "Edit this landmark", match: :first

    fill_in "Description", with: @landmark.description
    fill_in "Latitude", with: @landmark.latitude
    fill_in "Longitude", with: @landmark.longitude
    fill_in "Name", with: @landmark.name
    fill_in "Region", with: @landmark.region_id
    fill_in "User", with: @landmark.user_id
    click_on "Update Landmark"

    assert_text "Landmark was successfully updated"
    click_on "Back"
  end

  test "should destroy Landmark" do
    visit landmark_url(@landmark)
    click_on "Destroy this landmark", match: :first

    assert_text "Landmark was successfully destroyed"
  end
end
