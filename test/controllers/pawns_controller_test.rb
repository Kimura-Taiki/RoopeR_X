require 'test_helper'

class PawnsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pawns_index_url
    assert_response :success
  end

  test "should get new" do
    get pawns_new_url
    assert_response :success
  end

  test "should get show" do
    get pawns_show_url
    assert_response :success
  end

  test "should get edit" do
    get pawns_edit_url
    assert_response :success
  end

end