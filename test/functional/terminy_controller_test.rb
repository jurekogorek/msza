require 'test_helper'

class TerminyControllerTest < ActionController::TestCase
  setup do
    @termin = terminy(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:terminy)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create termin" do
    assert_difference('Termin.count') do
      post :create, termin: { dzien: @termin.dzien, godzina: @termin.godzina, komentarz: @termin.komentarz }
    end

    assert_redirected_to termin_path(assigns(:termin))
  end

  test "should show termin" do
    get :show, id: @termin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @termin
    assert_response :success
  end

  test "should update termin" do
    put :update, id: @termin, termin: { dzien: @termin.dzien, godzina: @termin.godzina, komentarz: @termin.komentarz }
    assert_redirected_to termin_path(assigns(:termin))
  end

  test "should destroy termin" do
    assert_difference('Termin.count', -1) do
      delete :destroy, id: @termin
    end

    assert_redirected_to terminy_path
  end
end
