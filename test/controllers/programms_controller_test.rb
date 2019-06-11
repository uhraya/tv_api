require 'test_helper'

class ProgrammsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @programm = programms(:one)
  end

  test "should get index" do
    get programms_url, as: :json
    assert_response :success
  end

  test "should create programm" do
    assert_difference('Programm.count') do
      post programms_url, params: { programm: { channel_id: @programm.channel_id, date: @programm.date, episode_id: @programm.episode_id, timeslot: @programm.timeslot } }, as: :json
    end

    assert_response 201
  end

  test "should show programm" do
    get programm_url(@programm), as: :json
    assert_response :success
  end

  test "should update programm" do
    patch programm_url(@programm), params: { programm: { channel_id: @programm.channel_id, date: @programm.date, episode_id: @programm.episode_id, timeslot: @programm.timeslot } }, as: :json
    assert_response 200
  end

  test "should destroy programm" do
    assert_difference('Programm.count', -1) do
      delete programm_url(@programm), as: :json
    end

    assert_response 204
  end
end
