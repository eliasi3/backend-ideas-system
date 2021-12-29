require "test_helper"

class DeptsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dept = depts(:one)
  end

  test "should get index" do
    get depts_url, as: :json
    assert_response :success
  end

  test "should create dept" do
    assert_difference('Dept.count') do
      post depts_url, params: { dept: { dep_name: @dept.dep_name } }, as: :json
    end

    assert_response 201
  end

  test "should show dept" do
    get dept_url(@dept), as: :json
    assert_response :success
  end

  test "should update dept" do
    patch dept_url(@dept), params: { dept: { dep_name: @dept.dep_name } }, as: :json
    assert_response 200
  end

  test "should destroy dept" do
    assert_difference('Dept.count', -1) do
      delete dept_url(@dept), as: :json
    end

    assert_response 204
  end
end
