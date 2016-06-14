require 'test_helper'

class CompaignsControllerTest < ActionController::TestCase
  setup do
    @compaign = compaigns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:compaigns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create compaign" do
    assert_difference('Compaign.count') do
      post :create, compaign: {  }
    end

    assert_redirected_to compaign_path(assigns(:compaign))
  end

  test "should show compaign" do
    get :show, id: @compaign
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @compaign
    assert_response :success
  end

  test "should update compaign" do
    patch :update, id: @compaign, compaign: {  }
    assert_redirected_to compaign_path(assigns(:compaign))
  end

  test "should destroy compaign" do
    assert_difference('Compaign.count', -1) do
      delete :destroy, id: @compaign
    end

    assert_redirected_to compaigns_path
  end
end
