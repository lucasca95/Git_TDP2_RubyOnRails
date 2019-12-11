require 'test_helper'

class DeviceVersionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get device_versions_create_url
    assert_response :success
  end

end
