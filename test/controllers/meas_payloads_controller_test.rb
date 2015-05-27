require 'test_helper'

class MeasPayloadsControllerTest < ActionController::TestCase
  setup do
    @meas_payload = meas_payloads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:meas_payloads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create meas_payload" do
    assert_difference('MeasPayload.count') do
      post :create, meas_payload: { name: @meas_payload.name, site: @meas_payload.site, value: @meas_payload.value }
    end

    assert_redirected_to meas_payload_path(assigns(:meas_payload))
  end

  test "should show meas_payload" do
    get :show, id: @meas_payload
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @meas_payload
    assert_response :success
  end

  test "should update meas_payload" do
    patch :update, id: @meas_payload, meas_payload: { name: @meas_payload.name, site: @meas_payload.site, value: @meas_payload.value }
    assert_redirected_to meas_payload_path(assigns(:meas_payload))
  end

  test "should destroy meas_payload" do
    assert_difference('MeasPayload.count', -1) do
      delete :destroy, id: @meas_payload
    end

    assert_redirected_to meas_payloads_path
  end
end
