require "test_helper"

class MissionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mission = missions(:one)
  end

  test "should get index" do
    get missions_url, as: :json
    assert_response :success
  end

  test "should create mission" do
    assert_difference('Mission.count') do
      post missions_url, params: { mission: { dept_id: @mission.dept_id, mis_description: @mission.mis_description, mis_image: @mission.mis_image, mis_name: @mission.mis_name, user_id: @mission.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show mission" do
    get mission_url(@mission), as: :json
    assert_response :success
  end

  test "should update mission" do
    patch mission_url(@mission), params: { mission: { dept_id: @mission.dept_id, mis_description: @mission.mis_description, mis_image: @mission.mis_image, mis_name: @mission.mis_name, user_id: @mission.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy mission" do
    assert_difference('Mission.count', -1) do
      delete mission_url(@mission), as: :json
    end

    assert_response 204
  end
end
