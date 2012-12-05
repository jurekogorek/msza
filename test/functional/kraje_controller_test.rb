require 'test_helper'

class KrajeControllerTest < ActionController::TestCase
  setup do
    @kraj = kraje(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kraje)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kraj" do
    assert_difference('Kraj.count') do
      post :create, kraj: { nazwa: @kraj.nazwa }
    end

    assert_redirected_to kraj_path(assigns(:kraj))
  end

  test "should show kraj" do
    get :show, id: @kraj
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @kraj
    assert_response :success
  end

  test "should update kraj" do
    put :update, id: @kraj, kraj: { nazwa: @kraj.nazwa }
    assert_redirected_to kraj_path(assigns(:kraj))
  end

  test "should destroy kraj" do
    assert_difference('Kraj.count', -1) do
      delete :destroy, id: @kraj
    end

    assert_redirected_to kraje_path
  end
end
