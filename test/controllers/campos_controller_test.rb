require "test_helper"

class CamposControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campo = campos(:one)
  end

  test "should get index" do
    get campos_url, as: :json
    assert_response :success
  end

  test "should create campo" do
    assert_difference('Campo.count') do
      post campos_url, params: { campo: { cam_nome: @campo.cam_nome, cam_tipo: @campo.cam_tipo, ies_obrigatorio: @campo.ies_obrigatorio, ies_ordem: @campo.ies_ordem, mission_id: @campo.mission_id } }, as: :json
    end

    assert_response 201
  end

  test "should show campo" do
    get campo_url(@campo), as: :json
    assert_response :success
  end

  test "should update campo" do
    patch campo_url(@campo), params: { campo: { cam_nome: @campo.cam_nome, cam_tipo: @campo.cam_tipo, ies_obrigatorio: @campo.ies_obrigatorio, ies_ordem: @campo.ies_ordem, mission_id: @campo.mission_id } }, as: :json
    assert_response 200
  end

  test "should destroy campo" do
    assert_difference('Campo.count', -1) do
      delete campo_url(@campo), as: :json
    end

    assert_response 204
  end
end
