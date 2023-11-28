require "test_helper"

class TemplatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get templates_index_url
    assert_response :success
  end

  test "should get create" do
    get templates_create_url
    assert_response :success
  end

  test "should get edit" do
    get templates_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get templates_destroy_url
    assert_response :success
  end
end
