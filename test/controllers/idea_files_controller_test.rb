require "test_helper"

class IdeaFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @idea_file = idea_files(:one)
  end

  test "should get index" do
    get idea_files_url, as: :json
    assert_response :success
  end

  test "should create idea_file" do
    assert_difference('IdeaFile.count') do
      post idea_files_url, params: { idea_file: { idea_file: @idea_file.idea_file, idea_id: @idea_file.idea_id } }, as: :json
    end

    assert_response 201
  end

  test "should show idea_file" do
    get idea_file_url(@idea_file), as: :json
    assert_response :success
  end

  test "should update idea_file" do
    patch idea_file_url(@idea_file), params: { idea_file: { idea_file: @idea_file.idea_file, idea_id: @idea_file.idea_id } }, as: :json
    assert_response 200
  end

  test "should destroy idea_file" do
    assert_difference('IdeaFile.count', -1) do
      delete idea_file_url(@idea_file), as: :json
    end

    assert_response 204
  end
end
