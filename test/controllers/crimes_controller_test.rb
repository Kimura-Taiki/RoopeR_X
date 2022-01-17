require 'test_helper'

class CrimesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get crimes_index_url
    assert_response :success
  end

  test "should get new" do
    get crimes_new_url
    assert_response :success
  end

  test "should get show" do
    get crimes_show_url
    assert_response :success
  end

  test "should get edit" do
    get crimes_edit_url
    assert_response :success
  end

end
