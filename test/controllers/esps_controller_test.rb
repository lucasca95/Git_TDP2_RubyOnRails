require 'test_helper'

class EspsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @esp = esps(:one)
  end

  test "should get index" do
    get esps_url
    assert_response :success
  end

  test "should get new" do
    get new_esp_url
    assert_response :success
  end

  test "should create esp" do
    assert_difference('Esp.count') do
      post esps_url, params: { esp: { mac: @esp.mac, version: @esp.version } }
    end

    assert_redirected_to esp_url(Esp.last)
  end

  test "should show esp" do
    get esp_url(@esp)
    assert_response :success
  end

  test "should get edit" do
    get edit_esp_url(@esp)
    assert_response :success
  end

  test "should update esp" do
    patch esp_url(@esp), params: { esp: { mac: @esp.mac, version: @esp.version } }
    assert_redirected_to esp_url(@esp)
  end

  test "should destroy esp" do
    assert_difference('Esp.count', -1) do
      delete esp_url(@esp)
    end

    assert_redirected_to esps_url
  end
end
