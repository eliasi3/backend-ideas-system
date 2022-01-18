require "test_helper"

class MissionDeptosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mission_depto = mission_deptos(:one)
  end

  test "should get index" do
    get mission_deptos_url, as: :json
    assert_response :success
  end

  test "should create mission_depto" do
    assert_difference('MissionDepto.count') do
      post mission_deptos_url, params: { mission_depto: { dept_id: @mission_depto.dept_id, mission_id: @mission_depto.mission_id } }, as: :json
    end

    assert_response 201
  end

  test "should show mission_depto" do
    get mission_depto_url(@mission_depto), as: :json
    assert_response :success
  end

  test "should update mission_depto" do
    patch mission_depto_url(@mission_depto), params: { mission_depto: { dept_id: @mission_depto.dept_id, mission_id: @mission_depto.mission_id } }, as: :json
    assert_response 200
  end

  test "should destroy mission_depto" do
    assert_difference('MissionDepto.count', -1) do
      delete mission_depto_url(@mission_depto), as: :json
    end

    assert_response 204
  end
end
