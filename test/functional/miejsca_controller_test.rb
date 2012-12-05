require 'test_helper'

class MiejscaControllerTest < ActionController::TestCase
  setup do
    @miejsce = miejsca(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:miejsca)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create miejsce" do
    assert_difference('Miejsce.count') do
      post :create, miejsce: { gmaps: @miejsce.gmaps, latitude: @miejsce.latitude, longitude: @miejsce.longitude, nazwa: @miejsce.nazwa }
    end

    assert_redirected_to miejsce_path(assigns(:miejsce))
  end

  test "should show miejsce" do
    get :show, id: @miejsce
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @miejsce
    assert_response :success
  end

  test "should update miejsce" do
    put :update, id: @miejsce, miejsce: { gmaps: @miejsce.gmaps, latitude: @miejsce.latitude, longitude: @miejsce.longitude, nazwa: @miejsce.nazwa }
    assert_redirected_to miejsce_path(assigns(:miejsce))
  end

  test "should destroy miejsce" do
    assert_difference('Miejsce.count', -1) do
      delete :destroy, id: @miejsce
    end

    assert_redirected_to miejsca_path
  end
end
