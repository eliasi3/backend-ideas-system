require "test_helper"

class RazaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @razao = razaos(:one)
  end

  test "should get index" do
    get razaos_url, as: :json
    assert_response :success
  end

  test "should create razao" do
    assert_difference('Razao.count') do
      post razaos_url, params: { razao: { ies_status: @razao.ies_status, razao_desc: @razao.razao_desc, razao_name: @razao.razao_name } }, as: :json
    end

    assert_response 201
  end

  test "should show razao" do
    get razao_url(@razao), as: :json
    assert_response :success
  end

  test "should update razao" do
    patch razao_url(@razao), params: { razao: { ies_status: @razao.ies_status, razao_desc: @razao.razao_desc, razao_name: @razao.razao_name } }, as: :json
    assert_response 200
  end

  test "should destroy razao" do
    assert_difference('Razao.count', -1) do
      delete razao_url(@razao), as: :json
    end

    assert_response 204
  end
end
