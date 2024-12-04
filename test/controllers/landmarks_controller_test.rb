require "test_helper"

class LandmarksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @landmark = landmarks(:one)
  end

  test "should get index" do
    get landmarks_url
    assert_response :success
  end

  test "should get new" do
    get new_landmark_url
    assert_response :success
  end

  test "should create landmark" do
    assert_difference("Landmark.count") do
      post landmarks_url, params: { landmark: { description: @landmark.description, latitude: @landmark.latitude, longitude: @landmark.longitude, name: @landmark.name, region_id: @landmark.region_id, user_id: @landmark.user_id } }
    end

    assert_redirected_to landmark_url(Landmark.last)
  end

  test "should show landmark" do
    get landmark_url(@landmark)
    assert_response :success
  end

  test "should get edit" do
    get edit_landmark_url(@landmark)
    assert_response :success
  end

  test "should update landmark" do
    patch landmark_url(@landmark), params: { landmark: { description: @landmark.description, latitude: @landmark.latitude, longitude: @landmark.longitude, name: @landmark.name, region_id: @landmark.region_id, user_id: @landmark.user_id } }
    assert_redirected_to landmark_url(@landmark)
  end

  test "should destroy landmark" do
    assert_difference("Landmark.count", -1) do
      delete landmark_url(@landmark)
    end

    assert_redirected_to landmarks_url
  end
end
