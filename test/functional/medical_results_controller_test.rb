require 'test_helper'

class MedicalResultsControllerTest < ActionController::TestCase
  setup do
    @medical_result = medical_results(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medical_results)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medical_result" do
    assert_difference('MedicalResult.count') do
      post :create, :medical_result => @medical_result.attributes
    end

    assert_redirected_to medical_result_path(assigns(:medical_result))
  end

  test "should show medical_result" do
    get :show, :id => @medical_result.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @medical_result.to_param
    assert_response :success
  end

  test "should update medical_result" do
    put :update, :id => @medical_result.to_param, :medical_result => @medical_result.attributes
    assert_redirected_to medical_result_path(assigns(:medical_result))
  end

  test "should destroy medical_result" do
    assert_difference('MedicalResult.count', -1) do
      delete :destroy, :id => @medical_result.to_param
    end

    assert_redirected_to medical_results_path
  end
end
