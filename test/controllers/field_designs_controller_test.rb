require "test_helper"

class FieldDesignsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get field_designs_index_url
    assert_response :success
  end
end
