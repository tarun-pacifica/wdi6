require 'test_helper'

class MoviiesControllerTest < ActionController::TestCase
  setup do
    @moviie = moviies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:moviies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create moviie" do
    assert_difference('Moviie.count') do
      post :create, moviie: { description: @moviie.description, obtained: @moviie.obtained, rating: @moviie.rating, released: @moviie.released, title: @moviie.title }
    end

    assert_redirected_to moviie_path(assigns(:moviie))
  end

  test "should show moviie" do
    get :show, id: @moviie
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @moviie
    assert_response :success
  end

  test "should update moviie" do
    patch :update, id: @moviie, moviie: { description: @moviie.description, obtained: @moviie.obtained, rating: @moviie.rating, released: @moviie.released, title: @moviie.title }
    assert_redirected_to moviie_path(assigns(:moviie))
  end

  test "should destroy moviie" do
    assert_difference('Moviie.count', -1) do
      delete :destroy, id: @moviie
    end

    assert_redirected_to moviies_path
  end
end
