require "test_helper"

class ValoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @valore = valores(:one)
  end

  test "should get index" do
    get valores_url, as: :json
    assert_response :success
  end

  test "should create valore" do
    assert_difference('Valore.count') do
      post valores_url, params: { valore: { campos_id: @valore.campos_id, ideas_id: @valore.ideas_id, val_cha: @valore.val_cha, val_dat: @valore.val_dat, val_dec: @valore.val_dec, val_fil: @valore.val_fil, val_tex: @valore.val_tex } }, as: :json
    end

    assert_response 201
  end

  test "should show valore" do
    get valore_url(@valore), as: :json
    assert_response :success
  end

  test "should update valore" do
    patch valore_url(@valore), params: { valore: { campos_id: @valore.campos_id, ideas_id: @valore.ideas_id, val_cha: @valore.val_cha, val_dat: @valore.val_dat, val_dec: @valore.val_dec, val_fil: @valore.val_fil, val_tex: @valore.val_tex } }, as: :json
    assert_response 200
  end

  test "should destroy valore" do
    assert_difference('Valore.count', -1) do
      delete valore_url(@valore), as: :json
    end

    assert_response 204
  end
end
