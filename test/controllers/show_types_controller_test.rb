require 'test_helper'

class ShowTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @show_type = show_types(:one)
  end

  test "should get index" do
    get show_types_url
    assert_response :success
  end

  test "should get new" do
    get new_show_type_url
    assert_response :success
  end

  test "should create show_type" do
    assert_difference('ShowType.count') do
      post show_types_url, params: { show_type: { name: @show_type.name } }
    end

    assert_redirected_to show_type_url(ShowType.last)
  end

  test "should show show_type" do
    get show_type_url(@show_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_show_type_url(@show_type)
    assert_response :success
  end

  test "should update show_type" do
    patch show_type_url(@show_type), params: { show_type: { name: @show_type.name } }
    assert_redirected_to show_type_url(@show_type)
  end

  test "should destroy show_type" do
    assert_difference('ShowType.count', -1) do
      delete show_type_url(@show_type)
    end

    assert_redirected_to show_types_url
  end
end
