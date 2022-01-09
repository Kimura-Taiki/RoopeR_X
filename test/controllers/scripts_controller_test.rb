require 'test_helper'

class ScriptsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get scripts_index_url
    assert_response :success
  end

  test "should get new" do
    get scripts_new_url
    assert_response :success
  end

  test "should get show" do
    get scripts_show_url
    assert_response :success
  end

  test "should get edit" do
    get scripts_edit_url
    assert_response :success
  end

end
