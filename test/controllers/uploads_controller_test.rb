require "test_helper"

class UploadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @upload = uploads(:one)
  end

  test "should get index" do
    get uploads_url, as: :json
    assert_response :success
  end

  test "should create upload" do
    assert_difference('Upload.count') do
      post uploads_url, params: { upload: { file: @upload.file } }, as: :json
    end

    assert_response 201
  end

  test "should show upload" do
    get upload_url(@upload), as: :json
    assert_response :success
  end

  test "should update upload" do
    patch upload_url(@upload), params: { upload: { file: @upload.file } }, as: :json
    assert_response 200
  end

  test "should destroy upload" do
    assert_difference('Upload.count', -1) do
      delete upload_url(@upload), as: :json
    end

    assert_response 204
  end
end
