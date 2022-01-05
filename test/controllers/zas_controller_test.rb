require 'test_helper'

class ZasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get zas_index_url
    assert_response :success
  end

  test "should get new" do
    get zas_new_url
    assert_response :success
  end

  test "should get show" do
    get zas_show_url
    assert_response :success
  end

  test "should get edit" do
    get zas_edit_url
    assert_response :success
  end

end
